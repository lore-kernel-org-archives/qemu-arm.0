Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp246770ejc;
        Thu, 19 Jan 2023 03:13:35 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuZkqDjJ3x2PblM5WYRH9yoGYlbnxdHNmzaiV9AZDxyKIA+5Mo+L6ylyhODUYqpS0gY1vN2
X-Received: by 2002:ac8:65d4:0:b0:3b6:308e:94a8 with SMTP id t20-20020ac865d4000000b003b6308e94a8mr20559208qto.43.1674126815024;
        Thu, 19 Jan 2023 03:13:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674126815; cv=none;
        d=google.com; s=arc-20160816;
        b=QPO2tBmeUg970HBtqJkXVo9RMRMMVqiDDSucECKERK3saIw+RTkrqxZCDjOkBhjntH
         ttLX3U0YDWl6rfx8Y9yvyRVfThmd0GbQIjgqJog65PEkDPdmGdrWzOBmeARkqeG9ekCs
         uOExSF3meSYKyKBfyXg1H2gsDdx1Q4TZY/5apvvmYe4WlGzC0TJHWF4VEYV/OSqlRWcO
         aMOm2KXYSLm+RfySrs2VR75FqhaJRX8surNb0meeMJdZ3VE6hfLr+GFltHEEHE41lQsH
         fjbIqqtKGXbFibYnKKcPBWxEnBmSg2u7ZuYtYBIv7d75w11Po3LfIYWHFMbf4O8JTDJy
         qxpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-disposition:user-agent:in-reply-to:mime-version:references
         :message-id:subject:cc:to:from:date:dkim-signature;
        bh=L3TjRLsmgBPdDuG0cIgu1MZ+P5YyZBG5cdukKbkExQI=;
        b=i04eyinZVFY1tKfLK9bRiOH7zqwT0lnrgIelKWx6BS+im2zZDU2QFOgIOsw+uYObQa
         eKUuRFo3xQc5I30nJr5tho3TQlXGT8NxGQQgkJ/L7Na7sB8VZB9LEdEfR9PUXRp36AG/
         isP91bK7R7706tylSTmwpSbE+Q8cYNrYx9QOIgCpiZTW94puVbzTeuZLWPG044nIlNj0
         3f8drKD3fqpGmFcSUcnp2xFUrAnvzVRCx5jG1RM/l82HoeE3CQWiW82kgoaUqu646a8I
         ji3tecmQleeX7SlLCKl8xQYP/Q5tA3j5YtTLwHSDLMrLxAOrOb2HDSaY7ZeBiCQzkRMJ
         ao3A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JMZp7myG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id fx10-20020a05622a4aca00b003b63940d49fsi5937387qtb.675.2023.01.19.03.13.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Jan 2023 03:13:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JMZp7myG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pISrC-0003be-Dy; Thu, 19 Jan 2023 06:13:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pISr8-0003b5-Vw
 for qemu-arm@nongnu.org; Thu, 19 Jan 2023 06:13:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pISr3-00015y-PH
 for qemu-arm@nongnu.org; Thu, 19 Jan 2023 06:13:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674126792;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L3TjRLsmgBPdDuG0cIgu1MZ+P5YyZBG5cdukKbkExQI=;
 b=JMZp7myGZOaFhPhk9vkbmEbGtdf18mob4XqKdttCrEHlx6Fq6BuXAfIrz02DAnMw4Hk6hv
 6J2LCgp9ur1LnTjP2iLr6YUVzqlF0rKBhaTQ6wKJxptVv1G5T3dDSBSUnavdwlgrq7AYdJ
 AgP78MhPTVQleGlCixl23KVPQlDRSek=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-260-KQAhb5SROW2FT7yNdrJs5w-1; Thu, 19 Jan 2023 06:13:11 -0500
X-MC-Unique: KQAhb5SROW2FT7yNdrJs5w-1
Received: by mail-wm1-f72.google.com with SMTP id
 n18-20020a05600c4f9200b003d993e08485so1050895wmq.2
 for <qemu-arm@nongnu.org>; Thu, 19 Jan 2023 03:13:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-transfer-encoding
 :content-disposition:mime-version:references:message-id:subject:cc
 :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=L3TjRLsmgBPdDuG0cIgu1MZ+P5YyZBG5cdukKbkExQI=;
 b=ZQDRVKUqkht4Qnl6RISpABNCksq9yrlqceGEzpdo1KvBkrWSNN7P+c5fD7l3IOfTkg
 adSAIfniGP3OSV+FM1oaKoY7w9tQRZiIjJofeWtqI6ylkjjO130hoBdxRM1EA22f57+2
 8dRJ12PxpE716LQy0wZHGvePiqLHWAz/Ook2fSXfghXpUBBblj6sChTpBgdTj0QbPNTM
 zfKLph6Uw3yuckSNkXIr75tpvDxZitMIHJfUwStNEOpf8yzbJF5nfCHPTi1mW7joZ27Y
 VQeJuYTj00MDX2ru1bzTfIyZ/7/8FJLxEqRc3Syl+OMZo9a0yOjnPO00dxhMZU/6/XyD
 9SHw==
X-Gm-Message-State: AFqh2ko6ubWP9hBTHz5kNEaj7hMdqzrRHXovelpnwUrHiM24Fr9sdLtj
 3u95vcOYmPDp9ziiW8sCXbFX761nfXOlBsjHynxiHCM9R4fy0D8eiRwf16H1GKevJVt+NLlJ6lR
 uDejXqaDOFq1O
X-Received: by 2002:a05:600c:6001:b0:3da:f80a:5e85 with SMTP id
 az1-20020a05600c600100b003daf80a5e85mr9737370wmb.26.1674126790623; 
 Thu, 19 Jan 2023 03:13:10 -0800 (PST)
X-Received: by 2002:a05:600c:6001:b0:3da:f80a:5e85 with SMTP id
 az1-20020a05600c600100b003daf80a5e85mr9737353wmb.26.1674126790404; 
 Thu, 19 Jan 2023 03:13:10 -0800 (PST)
Received: from work-vm
 (ward-16-b2-v4wan-166627-cust863.vm18.cable.virginm.net. [81.97.203.96])
 by smtp.gmail.com with ESMTPSA id
 s7-20020a1cf207000000b003db11dfc687sm4448660wmc.36.2023.01.19.03.13.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Jan 2023 03:13:10 -0800 (PST)
Date: Thu, 19 Jan 2023 11:13:07 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Fabiano Rosas <farosas@suse.de>,
 Juan Quintela <quintela@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-arm@nongnu.org
Subject: Re: [PATCH 8/8] tests/qtest/migration-test: Allow running with HVF
Message-ID: <Y8klwyh3fgmns+Wg@work-vm>
References: <20230119100537.5114-1-philmd@linaro.org>
 <20230119100537.5114-9-philmd@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20230119100537.5114-9-philmd@linaro.org>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: gbcubWbUBKF8

* Philippe Mathieu-Daudé (philmd@linaro.org) wrote:
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>

Does it support migration? I don't remember anyone ever mentioning it.

Dave

> ---
>  tests/qtest/migration-test.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
> index 1e7f1ea162..7a0fcfb81d 100644
> --- a/tests/qtest/migration-test.c
> +++ b/tests/qtest/migration-test.c
> @@ -47,6 +47,7 @@ unsigned start_address;
>  unsigned end_address;
>  static bool has_tcg;
>  static bool has_kvm;
> +static bool has_hvf;
>  static bool uffd_feature_thread_id;
>  
>  /*
> @@ -614,6 +615,9 @@ static int test_migrate_start(QTestState **from, QTestState **to,
>                                 args->use_dirty_ring
>                                 ? ",dirty-ring-size=4096" : "");
>      }
> +    if (has_hvf) {
> +        g_string_append(cmd_common, "-accel hvf ");
> +    }
>  
>      bootpath = g_strdup_printf("%s/bootsect", tmpfs);
>      if (strcmp(arch, "i386") == 0 || strcmp(arch, "x86_64") == 0) {
> @@ -2472,6 +2476,7 @@ int main(int argc, char **argv)
>  
>      has_tcg = qtest_has_accel("tcg");
>      has_kvm = qtest_has_accel("kvm");
> +    has_hvf = qtest_has_accel("hvf");
>  
>      g_test_init(&argc, &argv, NULL);
>  
> -- 
> 2.38.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

