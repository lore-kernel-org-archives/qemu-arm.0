Received: by 2002:a17:907:2723:b0:a5a:9152:cbdc with SMTP id d3csp777116ejl;
        Wed, 15 May 2024 09:32:09 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX/ZmAa/+iPySqjnhika+mifFNt8uW+UH3l+MqFkLftNxjN70rxsSm/DR00GxzPfp4/1pFjTN5ySKklmqLixwE5ygtguIdH
X-Google-Smtp-Source: AGHT+IFXfZE6HSO66vGO8XyfA/VD6fd2+0S18z87F14y7cjubddXICH0bH1KNgxibsKyFwXRR0uO
X-Received: by 2002:a05:620a:25ce:b0:790:c91a:73ae with SMTP id af79cd13be357-792bbdc4dffmr3241903585a.2.1715790728900;
        Wed, 15 May 2024 09:32:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1715790728; cv=none;
        d=google.com; s=arc-20160816;
        b=EESGCy0nBL+WqAcgrBgTAHL8B3peyJ6pWUHnI92EVGk8/IWCWVT0cUGhYjZ7S4bbRD
         F6sLEGx84eyCxhYsUXgNKcyF8BwrhOJ1dW016g0gnYzeDu8+5dAO49+i45Ovao/bZCdi
         47JDvcczSAlBt5beDiw/VPr1ai3uOnjxJjtUOFEWsysjd2ysbyioFUmSmyD8k4PJthCk
         lXKfndRarrFI2rn9Ptfp6TaPffXJ33Kdq1CsrRg7rXRSSVI3GTnRc+SNHTFrGo/lsbRZ
         IinYjkcl4ALpNvwAQV2Hv0iksPiRu+ZL2Dv+NVZVp6j3RNQcljDZYmQt/hBJen/RGLBZ
         QA8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-disposition:in-reply-to:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=tKz9jTX0SjVIbKmKK2PGDRuQtBFnZep0+IXsw1Ugmh0=;
        fh=W9o1F9ICqf7cemFN029ptAaEuHYQ7tLGFgZyN2CF/BQ=;
        b=YKyZA0hsvUhEkt5pwLEqDTIquPxczIy7UTUgOOGPkca5y/M5mySbThAjONhmHblGpO
         6w65hTZpQzqw25BmY5vXCUuUYiZJnGf5sE9sK2aEs8NhmScjlR3CkvhnvmZz/4UTCRRJ
         OKCPLpKAqJI8LX68PuVJXuoMHtVfcXnh+/EHX2PHRC81Xzv/FIwG1gdGNGuVt/jWthzH
         LX9Dubr8zaRzgI1/NZRfjTym7/Qgb+ka5BpFkpfcVmMeGASqtmmQGSEjESx+GviKWb5U
         lDyqtxMMYeX7cbf9m/KmHUc68HlviKCmmj/MmVkv3f81hgH1JbQLB1jzjxeg9YcNXaKh
         220w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=hjn17l5G;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-792bf33bac3si1439922185a.506.2024.05.15.09.32.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 May 2024 09:32:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=hjn17l5G;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1s7HXu-00015C-6d; Wed, 15 May 2024 12:32:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1s7HXs-00014s-K2
 for qemu-arm@nongnu.org; Wed, 15 May 2024 12:32:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1s7HXq-0003ED-Ut
 for qemu-arm@nongnu.org; Wed, 15 May 2024 12:32:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1715790718;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tKz9jTX0SjVIbKmKK2PGDRuQtBFnZep0+IXsw1Ugmh0=;
 b=hjn17l5G0XKruwg/Oj2p+HMNYZL6jT8I8kUoxbAiclI+738ko08iE/Cb3+175G2Wpeto2O
 F3ffgAMefQ8nAk4ag9Schdiwh44ju4mNGvwbcXkdauZdr6WW/dKkAJUHzX+jmQUUEAbZkv
 9Pid3KhMytDeAy5byO1N60EVqPrGASg=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-672-fiy21kSFMceKqE9NS0oQ9w-1; Wed, 15 May 2024 12:31:46 -0400
X-MC-Unique: fiy21kSFMceKqE9NS0oQ9w-1
Received: by mail-pf1-f199.google.com with SMTP id
 d2e1a72fcca58-6f05561060aso51654b3a.3
 for <qemu-arm@nongnu.org>; Wed, 15 May 2024 09:31:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715790705; x=1716395505;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tKz9jTX0SjVIbKmKK2PGDRuQtBFnZep0+IXsw1Ugmh0=;
 b=wqggL+Gucak20/bj79KBMvWlLk+xzjVxsmUoGwqbl8NDHJxUo/prpUT+T5VhAHGinX
 cTRSQJjrkHHbmsj53tMk00V+Kqwspx2J35qQnYHpZggBPd4nVEJGjZ+vRXbckmgH4RE8
 ottk+ERX27Aqh0tjE4oAu3rpsoyYg0/xFeZa2e+czLdPXiFSKdoXGWhnO4vclWlR2gzI
 jfSQNNw255UJCX89pIwj2l7a4c1XCUrpUF9Oh0q+D31lKm26T7NqKWzOlC5gCz8dcGAr
 Je826s0sg384n+agUlvXdIxFaCp78xzJ7aMOvr2MQzxr5ht2vj+GfyMxswQNLBemedOz
 hIgg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUGn5d68ICDjoHPRMMyELAaernc6fLHhVLD7qFVcosdzEh/3LYszekG5W18WV6pi03LMHRHp6NkExyDANGHO0FBI5SO
X-Gm-Message-State: AOJu0YzWTSgjp+s2C0W5cvfRi7GcCJKx2MzhNgU4u8/zOrCBSUzQnGJa
 +LRId1Lt41Bo2gaXHrST8wHRyGDQIJMClldxCK9/GYKiY4XXFqpD9wUnixEMSWSWjKRSn7qN1Ct
 pyttDAiUPBhQc8YeJsEjOvuHb0tJMswv0Ced9osVyRt9zdlsjmg==
X-Received: by 2002:a05:6a21:7896:b0:1ae:42c8:4f69 with SMTP id
 adf61e73a8af0-1afddf12a2cmr19760296637.0.1715790705340; 
 Wed, 15 May 2024 09:31:45 -0700 (PDT)
X-Received: by 2002:a05:6a21:7896:b0:1ae:42c8:4f69 with SMTP id
 adf61e73a8af0-1afddf12a2cmr19760255637.0.1715790704735; 
 Wed, 15 May 2024 09:31:44 -0700 (PDT)
Received: from x1n ([50.204.89.32]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-6f679902e57sm824350b3a.110.2024.05.15.09.31.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 May 2024 09:31:44 -0700 (PDT)
Date: Wed, 15 May 2024 10:31:32 -0600
From: Peter Xu <peterx@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: marcandre.lureau@redhat.com, qemu-devel@nongnu.org,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Fiona Ebner <f.ebner@proxmox.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Fabiano Rosas <farosas@suse.de>, Gerd Hoffmann <kraxel@redhat.com>,
 Yanan Wang <wangyanan55@huawei.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: Re: [PATCH v3 5/5] virtio-gpu: fix v2 migration
Message-ID: <ZkTjZCTwIbkZIVZd@x1n>
References: <20240515141557.1277999-1-marcandre.lureau@redhat.com>
 <20240515141557.1277999-6-marcandre.lureau@redhat.com>
 <20240515120104-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20240515120104-mutt-send-email-mst@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.935,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_SORBS_WEB=1.5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: nEQGCbYPfMqb

On Wed, May 15, 2024 at 12:02:49PM -0400, Michael S. Tsirkin wrote:
> On Wed, May 15, 2024 at 06:15:56PM +0400, marcandre.lureau@redhat.com wrote:
> > From: Marc-André Lureau <marcandre.lureau@redhat.com>
> > 
> > Commit dfcf74fa ("virtio-gpu: fix scanout migration post-load") broke
> > forward/backward version migration. Versioning of nested VMSD structures
> > is not straightforward, as the wire format doesn't have nested
> > structures versions.
> > 
> > Use the previously introduced check_machine_version() function as a
> > field test to ensure proper saving/loading based on the machine version.
> > The VMSD.version is irrelevant now.
> > 
> > Fixes: dfcf74fa ("virtio-gpu: fix scanout migration post-load")
> > Suggested-by: Peter Xu <peterx@redhat.com>
> > Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> I don't get it. Our standard way to do it is:
> - add a property (begin name with x- so we don't commit to an API)
> - set from compat machinery
> - test property value in VMSTATE macros
> 
> Big advantage is, it works well with any downstreams
> which pick any properties they like.
> Why is this not a good fit here?

I think it'll simplify upstream to avoid introducing one new field + one
new property for each of such protocol change, which fundamentally are the
same thing.  But it's indeed a good point that such helper can slightly
complicate the backport a bit.. I assume a global replacement of versions
over the helper will be needed after downstream settles on how to map
downstream MCs to upstream's.

Thanks,

-- 
Peter Xu

