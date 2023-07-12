Received: by 2002:a17:906:1917:b0:98d:b2f5:1316 with SMTP id a23csp2412989eje;
        Wed, 12 Jul 2023 00:29:04 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGgMg/QHpCOKRovVcmWmYuau8SMn3y4sZGMlLR5cebTnrKVnaUdSOd82zrp/azbHF4w9vHK
X-Received: by 2002:adf:d0c3:0:b0:314:323b:9d3b with SMTP id z3-20020adfd0c3000000b00314323b9d3bmr823659wrh.32.1689146944271;
        Wed, 12 Jul 2023 00:29:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1689146944; cv=none;
        d=google.com; s=arc-20160816;
        b=E37hiSWZadFDbO4Q44e1FO2IA/R2xrE/uYUBjkhZxh/drmqC3uvERgT8H2HrSUpR/b
         amBIF49z6xmPKioTBe6lxFgHQtYdXazkx5omND/SuUHhxGgP0Bk71VJfe+GBbHTN6IvM
         5paATZcVNyJcC6ObLYzEZRyOzqyn3hsMdmXlpHSkRpZtFTLIdp+tSg/P5TboDZbXmLrx
         l2OrhYEsH/sR4595xH7FsakHMvbdI1RtAgXZ3p6uen4hv2NXfur3v5hQTuv9z5wZOyNv
         ERfIcDu8le80S4KvHL+95IcCUoQ9whTdtzXfTnPpIiezNt03gGV5cZcLQOiOKU3iU5Za
         M7Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:organization:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=xvK4HTLBwNIYDQlqUppsOq5aMRVvzlPzY1paTVdKXIE=;
        fh=sftjbdlV8xbfixci2skt2muq7L2agGiYTCVZ2fDXY9E=;
        b=Ds27kLuY4YQ+lXZdrQmzPD9JhqCLHUHvaxZF4AfowHq5pCU1x0UH6UCDgAjUBe/+ij
         YxzZpv0LYl9dhfUkMUne0SEgX/TLDgWurxFjbjRwxh256FfT1CwsLffhENbjvuV9TR/A
         cp6znQ1OwTu25SMOJBDyTdet0+Ce72577eZmmbSKnhLPwOAi/ALQdIkAjZMLdvoK95nb
         w9bMHR1wGS8duf6sjjro5OrmF/28qUqnrcoaEzXmwzDBJLh0L9CGZW+sDx5q90vOSlQm
         2BZ0ba2LkzG7BVd1fiNpr63zy89Xv9kJ/Ovq6R4D/G8KpRLwpkV2h7gsnE70pPayp5gP
         rw8w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QwcRjKUd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t3-20020a5d49c3000000b003141e61ba97si2065374wrs.384.2023.07.12.00.29.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 12 Jul 2023 00:29:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QwcRjKUd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qJUHE-0002Mc-5z; Wed, 12 Jul 2023 03:28:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1qJUH7-0002M8-KO
 for qemu-arm@nongnu.org; Wed, 12 Jul 2023 03:28:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1qJUH6-0000zE-25
 for qemu-arm@nongnu.org; Wed, 12 Jul 2023 03:28:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1689146915;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xvK4HTLBwNIYDQlqUppsOq5aMRVvzlPzY1paTVdKXIE=;
 b=QwcRjKUda64GGx02zEJYh65wGoG5fzHaDChVuAe7cqd/KVVvyQRezuBWFNd0rX+SX2h+Sg
 i4SF12YFC3LhX7AYo3YM6HGtbnsuSDjNpvXDcqHBjX/kc2+0VTDimzNKywWk36X8KbzhOH
 BP9gqVs0Kz2k4W+AWzeaMFonXxNYuuI=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-675-WSbFdbE4P3GI11p0GrFeEA-1; Wed, 12 Jul 2023 03:27:54 -0400
X-MC-Unique: WSbFdbE4P3GI11p0GrFeEA-1
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-313e6020882so159873f8f.1
 for <qemu-arm@nongnu.org>; Wed, 12 Jul 2023 00:27:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689146873; x=1691738873;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xvK4HTLBwNIYDQlqUppsOq5aMRVvzlPzY1paTVdKXIE=;
 b=jOxcgYUoLs+kV4bqGdSoHYHTTPxqTAS91NwPlvUsmzZ6eUcUcjs6+PS0cMdpPgL90O
 QQRKaXujDPAGpe50kBtEGltFLkEwwDOw4UvvaErR4ynMsdBm1zCw/tzNt0rAaXiXGv4d
 0cjOkvksF3cXMmUjDfdXnWfrji42JPTrnM6V2VquVdCUL4dCL5PFC8eS0zmmyl0xpQbh
 mf1hfVYyj6QyXzBoN4w8es5wnoS0q1AjrcmzgvVauV3QUhRjQ/biMGQdoNeCnVmoBNLK
 ZmCzdjEQA3Mf6n6gS1eCev+Wo6m3L0ii6c9CNX3Tr8voS3JVwA/SH+Hm+rPeUOaIWc07
 6ymg==
X-Gm-Message-State: ABy/qLbnV8sJu3ZPv/42CHZuCGuHye/miDZ7Gt8aevaA/7U9TXqztuyb
 4NoQlOSUTAwXN0LDYzo6PXhLkRu411JtJnEwK9sFV92Xb66xyYR+HBbuOjZTypysZXp+08HeYq/
 UO0TQIzXK8KfH
X-Received: by 2002:adf:f9c6:0:b0:313:f000:5de6 with SMTP id
 w6-20020adff9c6000000b00313f0005de6mr898451wrr.16.1689146873224; 
 Wed, 12 Jul 2023 00:27:53 -0700 (PDT)
X-Received: by 2002:adf:f9c6:0:b0:313:f000:5de6 with SMTP id
 w6-20020adff9c6000000b00313f0005de6mr898417wrr.16.1689146872886; 
 Wed, 12 Jul 2023 00:27:52 -0700 (PDT)
Received: from ?IPV6:2003:cb:c707:3700:3eea:ace6:5bde:4478?
 (p200300cbc70737003eeaace65bde4478.dip0.t-ipconnect.de.
 [2003:cb:c707:3700:3eea:ace6:5bde:4478])
 by smtp.gmail.com with ESMTPSA id
 h25-20020a1ccc19000000b003fbcf032c55sm14900674wmb.7.2023.07.12.00.27.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Jul 2023 00:27:52 -0700 (PDT)
Message-ID: <5be74bef-8a0d-af77-85eb-edbc07c8fff7@redhat.com>
Date: Wed, 12 Jul 2023 09:27:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v4 0/7] virtio-mem: Device unplug support
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, "Michael S. Tsirkin"
 <mst@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, qemu-arm@nongnu.org,
 Gavin Shan <gshan@redhat.com>, Mario Casquero <mcasquer@redhat.com>
References: <20230711153445.514112-1-david@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20230711153445.514112-1-david@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.089, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: Qy09pokxd+2E

On 11.07.23 17:34, David Hildenbrand wrote:
> One limitation of virtio-mem is that we cannot currently unplug virtio-mem
> devices that have all memory unplugged from the VM.
> 
> Let's properly handle forced unplug (as can be triggered by the VM) and
> add support for ordinary unplug (requests) of virtio-mem devices that are
> in a compatible state (no legacy mode, no plugged memory, no plug request).
> 
> Briefly tested on both, x86_64 and aarch64.

Queued to

https://github.com/davidhildenbrand/qemu.git mem-next

-- 
Cheers,

David / dhildenb

