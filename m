Received: by 2002:a0c:e144:0:0:0:0:0 with SMTP id c4csp1499748qvl;
        Fri, 3 Jul 2020 06:10:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxr5FAt0pe3xpq9MVBrvlZXAdLt6axSoqzQM0qTwGVKabGXQiEMU6laIzkV/hkqQNrxDKjQ
X-Received: by 2002:a25:2e48:: with SMTP id b8mr55161248ybn.56.1593781848107;
        Fri, 03 Jul 2020 06:10:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593781848; cv=none;
        d=google.com; s=arc-20160816;
        b=nQLeeokzzTVv1sSHwhwPei6VbH7nmc903fTjw3UsHDX68RymA/YEf83lHTgOqlYuBU
         F0J7UGNsGLcCNOOzfudsNYy4TWdiJuojZg3IJ2uLMOkrZ3KTqfNTSGFOn0VuR/uuoE0f
         ttpLy6kd+sBFNLgiFw9f73jHouEv11dfIXK9vwX9Dz7kXPxWp462gLsjcAAds3/qS1ua
         RDecp06jcqScMxeDWoFlUiC0UsdhcCJxpl+dYMOFOHRfb5PM8pZ1fHcqBbzKvJ2w6gbN
         Et9GvHrRJKZt7Ais8AaBLNzlatX+YuKI+akJuyIQr+P36cKHIaZ5SD+ruemDeK5I8T8v
         5VGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=0xC+1tB/X3Hg9sPTKrM93ZST5q5wyY8bmlg2TtrHq2o=;
        b=FnI6K7ZS//jPy9ooeIaSaogh8I8l6F/NWSYAFAE/oZ9YDBLaVjIRS+PPw/MAy+OwKD
         hmEeSc8DOotldRak2Gk6MTNl/qPtYBvhbBPt1VEtT77bF6sBHjGXLC7bnC9dWjHjxQ2w
         Jn0LzrCVrYzkJz9e8DEs8tecnM2yneCC6mg4mJ3MHaDQMGOnfySlm642G+Ii5SGcDQSc
         RQg43irb1syOSamf8jGlOhmCUj3MfMFgH/4G0UHeQ350QSLbwmeNvOSIs5WV/9uRzyQX
         KCxKK/1rplJ/jVVB0++4DBaVKCAYjBRprA8sU6SGCCjYfJz2imc++v6fM2oETWOvYLnG
         x5Ng==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=BmJbtq6R;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n8si11965598ybc.320.2020.07.03.06.10.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Jul 2020 06:10:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=BmJbtq6R;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:51706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jrLSp-0002ou-Lg
	for alex.bennee@linaro.org; Fri, 03 Jul 2020 09:10:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1jrLRx-0001fI-B2
 for qemu-devel@nongnu.org; Fri, 03 Jul 2020 09:09:53 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:33288
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1jrLRv-0006lD-Ny
 for qemu-devel@nongnu.org; Fri, 03 Jul 2020 09:09:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593781790;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0xC+1tB/X3Hg9sPTKrM93ZST5q5wyY8bmlg2TtrHq2o=;
 b=BmJbtq6R2iqrHP3qUq84TKOv8hibrV39k9P3/+FMYDL5Us278i/mVWMrt3BwfN5nh7etIK
 GEGeBVuInrQ+KyTvHoBmlGlw4tVsbvEJXy2iXGv/icrmI45wHkXLJOAaGSUCCZW7ETdcnl
 FlwdhNnjsYR+vN50gtFdPspuDXNefB4=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-310-Xvsl93xpOd2sTnl3GarNPg-1; Fri, 03 Jul 2020 09:09:49 -0400
X-MC-Unique: Xvsl93xpOd2sTnl3GarNPg-1
Received: by mail-wr1-f70.google.com with SMTP id 89so8059807wrr.15
 for <qemu-devel@nongnu.org>; Fri, 03 Jul 2020 06:09:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=0xC+1tB/X3Hg9sPTKrM93ZST5q5wyY8bmlg2TtrHq2o=;
 b=tqFpE/nvjeJ4yHVI1IMMSTnFA5VKzOKP/2J4eYrUW3eambFYrjXz8eqU31/U9Kqk1i
 0k8rzHD04Vv5kHVIOjvx9RVjunXPHFIALn/GLhrQA0jW+NDDmlo9xd+/j7C/Zj8WF6pe
 tUM8feLJiBGdldPrSS+sRTrAwYa7kojCWGuqBI6a/5760pHRqoa1I8deWpqddrQaOi3I
 0s+kQHN+x7xC33qNO+wRXMizQ1rOtvKXSgrAC+osLCHCOwW12A2s5jsNRS9t2mGy96m1
 Ucb4ZbSuhylSYyZ7VYQiffEtSJni+zv4lrG2epiK9bQporyV5sjSmwUoKVZwrnvnwmd0
 RkHA==
X-Gm-Message-State: AOAM531cCSP/jfkpuEwUNt38Uz97DQMOoY55ggxL7nVFzflrAKWRkzTd
 TkBdtFKMCQHX8cGopg0sBq0jyamQeCoCm4J/Y4LqURIs17URwp3AHt6eAVof/g88ousXspTiX8X
 RWIURTDxXX+yj+G4=
X-Received: by 2002:adf:8091:: with SMTP id 17mr24659633wrl.13.1593781788235; 
 Fri, 03 Jul 2020 06:09:48 -0700 (PDT)
X-Received: by 2002:adf:8091:: with SMTP id 17mr24659588wrl.13.1593781787931; 
 Fri, 03 Jul 2020 06:09:47 -0700 (PDT)
Received: from redhat.com (bzq-79-182-31-92.red.bezeqint.net. [79.182.31.92])
 by smtp.gmail.com with ESMTPSA id
 r67sm14360833wmr.9.2020.07.03.06.09.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jul 2020 06:09:47 -0700 (PDT)
Date: Fri, 3 Jul 2020 09:09:43 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v4 08/21] microvm/acpi: add minimal acpi support
Message-ID: <20200703084039-mutt-send-email-mst@kernel.org>
References: <20200702204859.9876-1-kraxel@redhat.com>
 <20200702204859.9876-9-kraxel@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200702204859.9876-9-kraxel@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.61; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/03 03:17:33
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 qemu-devel@nongnu.org, Shannon Zhao <shannon.zhaosl@gmail.com>,
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4SU55SfYh3ZE

On Thu, Jul 02, 2020 at 10:48:46PM +0200, Gerd Hoffmann wrote:
> +    /* copy AML table into ACPI tables blob and patch header there */
> +    g_array_append_vals(table_data, dsdt->buf->data, dsdt->buf->len);
> +    build_header(linker, table_data,
> +        (void *)(table_data->data + table_data->len - dsdt->buf->len),
> +        "DSDT", dsdt->buf->len, 5, NULL, NULL);

Why 5? Just curious ...

-- 
MST

