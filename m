Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp1474720lfp;
        Fri, 1 Oct 2021 10:09:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwyPh6uuhmUon9ljP3kdx6pQY54ItLpFLMZ1luoe3/6DUglZhB8o+wFZXIVDVvQVoQJuxvI
X-Received: by 2002:adf:e906:: with SMTP id f6mr13939351wrm.207.1633108153196;
        Fri, 01 Oct 2021 10:09:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1633108153; cv=none;
        d=google.com; s=arc-20160816;
        b=nCsbucnNW2qc4Mo/dPfiurwsstHpZVrFgduKq4QH9MWS5r/oKpmX2QlJQ8MlfaJAUT
         g+pZjzh4YGVTx8FsTqTtw/s2trhIkUY9GpCYd0E/P2xxMgoAKE3rw5pwOqmOxe339D/k
         90LWQ/dalPJJZkvLoJgw3U9/YW+8dMKA2qz1B7ay53AEy0v/++hH4OsVcicIa9VZ0TL7
         OcLh1ktuRzEnDoQhn3+yfb7O4GMhiSn1CPC+7rQr8HMtmXFlS5BFwmFLh8SbaN7dot1L
         yF5SfE00C/2PLkAFEDip0i6jkKiqtvkuvbgYx1iYqmSvvTostcoC+SVG3tMDodbCC2Az
         2fqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:to:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=LFYj8tMR3LV+DDeWXB2T23z8D1+YVTTqU/iTD59oPMo=;
        b=SvDqc4xxNyv/JxvZEaF+Epv8I+GnKR7wFqP/Hf8KrRXNz46HZhcr7KMWJaOfptZ5hm
         lh6LvalXdnDMzOaHhwAAne+SKsEsYoiNpYAd3Erejguz22gfutZ4ba8J5Zvy/WtSUlRW
         SbH2kxrOWdwUsIMtGTjNfJq7uoKZFAN5BfeTYRNCWOvqdL8vW2brv1N5vKjgQmWbJj0/
         A58XdYdvIeYkLU6UsCUEmWbuJOgYKFDloRRXr09a1JlvgLZ7eZ21d0uPiN9IJGxaq2Ix
         vUBn8UMF8lbt/PxInue8woWkoBji4L2brs9pbmtWhw3APMfXmkNuQaqMWoHjTF4jpUSw
         GeQg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=IXdt6LVf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e13si10073815wrg.567.2021.10.01.10.09.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 01 Oct 2021 10:09:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=IXdt6LVf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mWM24-0001Iz-Am
	for alex.bennee@linaro.org; Fri, 01 Oct 2021 13:09:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mWM1t-0001GC-Rb
 for qemu-arm@nongnu.org; Fri, 01 Oct 2021 13:09:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44199)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mWM1q-0002J3-93
 for qemu-arm@nongnu.org; Fri, 01 Oct 2021 13:09:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633108136;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LFYj8tMR3LV+DDeWXB2T23z8D1+YVTTqU/iTD59oPMo=;
 b=IXdt6LVfuuc4TFqAOiUUJttJpnTND2p95nZVrrF+dR0xxiefxnoeF7fy8BIcK7IC3nKkco
 NMfV9QZJxtz2u6ocanbf1jB57aamJoG98mtWukp5x9eQaX33cL7j2/ElXBkbil7Xt2AZuz
 juh/Aj2OVrH4c0gFckQHgt6cE/yCrII=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-537-q9t3_2BTO1uYVzbyT4hlJA-1; Fri, 01 Oct 2021 13:08:55 -0400
X-MC-Unique: q9t3_2BTO1uYVzbyT4hlJA-1
Received: by mail-ed1-f69.google.com with SMTP id
 u17-20020a50d511000000b003daa3828c13so11010291edi.12
 for <qemu-arm@nongnu.org>; Fri, 01 Oct 2021 10:08:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=LFYj8tMR3LV+DDeWXB2T23z8D1+YVTTqU/iTD59oPMo=;
 b=pnlQGESQOfIAzzMgu5FUrfdQn+3e0cPuojeYB0niLgGV6fid/vnFSLhi5zSMd4HHog
 7B6VH3w7O6Luz3VJJOxeXJyr6jRX8LqmYNcR0Lejelzfb0JgsMmUkGY0h6oaVsSMIgYZ
 VqwZPWCpnhQn/5OijjT4GDYTfg3061aVe8OfmvjKDlC//n9AIPpC/tQi6tpePB0YLCSi
 MAqEq1BfdxGwK3sUc5zxnLOfDqE+lD/E0n6Yl6cKfybHDY/+GWAjAMANo6tczYF73f/I
 KHfp6mJV7R6P6FJdwokcHw9lJlmiOPWcBVVxCZIzMhLaQnsCN//lO9sINx/Q+/SAmNE9
 VEAQ==
X-Gm-Message-State: AOAM532cxrQv/9obnYy9f1+tlxq5C/8g3rhcStKikCvPELxqNjyrU6/k
 HN4z/BOGeEvHtIFIH3aD6lncREsyEdapv7tl6UImR5N3cRxHOKs0lHj94dRCCaWj96fObYaLEaw
 yt58+lLGWQH7S
X-Received: by 2002:aa7:d99a:: with SMTP id u26mr15539472eds.320.1633108134387; 
 Fri, 01 Oct 2021 10:08:54 -0700 (PDT)
X-Received: by 2002:aa7:d99a:: with SMTP id u26mr15539425eds.320.1633108134061; 
 Fri, 01 Oct 2021 10:08:54 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id s15sm3516327edu.91.2021.10.01.10.08.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Oct 2021 10:08:53 -0700 (PDT)
Message-ID: <0343d17f-bb46-a266-7ba4-20bdf30631d0@redhat.com>
Date: Fri, 1 Oct 2021 19:08:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v12 16/16] machine: Make smp_parse return a boolean
To: Yanan Wang <wangyanan55@huawei.com>, Eduardo Habkost
 <ehabkost@redhat.com>, =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, Andrew Jones <drjones@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
References: <20210929025816.21076-1-wangyanan55@huawei.com>
 <20210929025816.21076-17-wangyanan55@huawei.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20210929025816.21076-17-wangyanan55@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.127,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Pierre Morel <pmorel@linux.ibm.com>,
 Pankaj Gupta <pankaj.gupta.linux@gmail.com>, qemu-ppc@nongnu.org,
 Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 "Michael S . Tsirkin" <mst@redhat.com>, wanghaibin.wang@huawei.com,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fRpmwNVIZkI6

On 29/09/21 04:58, Yanan Wang wrote:
> @@ -933,8 +935,7 @@ static void machine_set_smp(Object *obj, Visitor *v, const char *name,
>           return;
>       }
>   
> -    smp_parse(ms, config, errp);
> -    if (*errp) {
> +    if (!smp_parse(ms, config, errp)) {
>           qapi_free_SMPConfiguration(config);
>       }
>   }
> 

This is actually a leak, so I'm replacing this patch with

diff --git a/hw/core/machine.c b/hw/core/machine.c
index 54f04a5ac6..d49ebc24e2 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -897,7 +897,7 @@ static void machine_set_smp(Object *obj, Visitor *v, const char *name,
  {
      MachineClass *mc = MACHINE_GET_CLASS(obj);
      MachineState *ms = MACHINE(obj);
-    SMPConfiguration *config;
+    g_autoptr(SMPConfiguration) config = NULL;
      ERRP_GUARD();
  
      if (!visit_type_SMPConfiguration(v, name, &config, errp)) {
@@ -920,7 +920,7 @@ static void machine_set_smp(Object *obj, Visitor *v, const char *name,
  
      smp_parse(ms, config, errp);
      if (*errp) {
-        goto out_free;
+        return;
      }
  
      /* sanity-check smp_cpus and max_cpus against mc */
@@ -935,9 +935,6 @@ static void machine_set_smp(Object *obj, Visitor *v, const char *name,
                     ms->smp.max_cpus,
                     mc->name, mc->max_cpus);
      }
-
-out_free:
-    qapi_free_SMPConfiguration(config);
  }
  
  static void machine_class_init(ObjectClass *oc, void *data)

which removes the need.

Paolo

