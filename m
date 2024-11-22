Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp5520334njc;
        Fri, 22 Nov 2024 08:22:29 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWq/iBM2VH6K3+/RPeQ8BFgfwT6O+/sEga0f4ra3Qtn4DBKaTqAygjOFMr4eM+jkK4RGE+iKp4lwqJGGA==@linaro.org
X-Google-Smtp-Source: AGHT+IGZWlsbMkjLZYmnblrOKu5fDA3zow2vUSFKmT/wUB55Z6RZ6Oe3gcukDIKh9p7I8djOq3zU
X-Received: by 2002:a05:690c:708e:b0:6af:6762:eba1 with SMTP id 00721157ae682-6eee09e988dmr39586817b3.20.1732292549462;
        Fri, 22 Nov 2024 08:22:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732292549; cv=none;
        d=google.com; s=arc-20240605;
        b=dWHEctDtS3zO55FcuZxG3z1+fA9jD29UXZWuhDhnf0KQKsorw8jET2cEQTyPxO6j8n
         h00yaZLzSxdyy/EClRQfiakti+QZQLkq4EzXgIoOuGRJtPN82iPLC/Pc0w4Gt1zNRLWD
         1kfnO6VepdiqW0Sxgivnzc2hzRqJSock+53hLBSErN6JKphaM480Vs10R/0qd44qSRiD
         72nXMb84vDkbk9lu/Kd1FY3x+qIBPbI2a0f9AduWgfGmNZSGLELmCPg8eXJ88btw0+D1
         ZRRntAoGTiBZReVCvr1blxW83bAd1hgnH/VLYH1mWW8Aexrv1ELajGKOgsC4mkvfVEYc
         fm5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:dkim-signature;
        bh=NyV4m9dJITsICN0qNNwyYDHcaqurrOEnQKifJ5kQsB0=;
        fh=CKLXHru8a9KlF8uEIJw2/35ftBi17c08me8OxfjdrqA=;
        b=PL/sovxnRilreORR6w6mZhq58ucDowYNHYQyoWNojbXhBPy/gHaO4m95zmnrTKKNlF
         nD76H3ATkH0kGN5JS3VzfLDy+Og6ahp40hmNSvw0c2l3WQx1YRUpzZ5QCYGyVFgrcSLy
         v87TPOVpucAn44iJP2hc0c3Za2W3hSOthycGodmQHKsq1MwbYj1jDPe+NarJQioKrnFa
         SOXd2mIFzNIeRkW8vvAvJZ3WJe+aZSnovTgrT4R7JyW6i+RKBhHHbTPWjHhFfRv12h56
         cayIz0GGFAmZTA+tnAT6Yer4V2wUsMnx9Z1AKOyfnnjvPlXtfOD/z7xX8QoEPxIr0SGb
         nstQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JrjkHWeM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4666fd39315si4718701cf.43.2024.11.22.08.22.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 22 Nov 2024 08:22:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JrjkHWeM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tEWQ4-0005cu-E3; Fri, 22 Nov 2024 11:22:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1tEWQ3-0005cf-Eo
 for qemu-arm@nongnu.org; Fri, 22 Nov 2024 11:22:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1tEWQ1-0003m3-TO
 for qemu-arm@nongnu.org; Fri, 22 Nov 2024 11:22:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1732292523;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NyV4m9dJITsICN0qNNwyYDHcaqurrOEnQKifJ5kQsB0=;
 b=JrjkHWeMBS2MsQwsS2j5M2Dxafe11IcuMQpzOAkI6tAmkHCMdyXJKzKNpdxWdNka7NnI8n
 9UwvJhC5cXzCNdawVgHasAPTSD/TDVPqyk0sXo6102K9rtnkkLz9gc2CmK9r7sKV48OHIP
 MIHj5laTh6J2uzj8lz9nE9abda2yqMg=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-253-MIxo6KXpMY-NM0z285-H4g-1; Fri, 22 Nov 2024 11:22:01 -0500
X-MC-Unique: MIxo6KXpMY-NM0z285-H4g-1
X-Mimecast-MFC-AGG-ID: MIxo6KXpMY-NM0z285-H4g
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-4314a22ed8bso16124865e9.1
 for <qemu-arm@nongnu.org>; Fri, 22 Nov 2024 08:22:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732292520; x=1732897320;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NyV4m9dJITsICN0qNNwyYDHcaqurrOEnQKifJ5kQsB0=;
 b=stCtUteYIS0DK1yTbUSCLAzmW9GpGfi6zUsDp/puynT2q+qmOMNe8RA5Vs/ahC3CJd
 flU4OK2di8gkJS0tnyS5Wz914y+OJ5VMngTOzre7PhWi9GhQ8cjCVBCcQ146Ker37LA1
 jEf+Zp8/JNirCLZXczir7sjGPm5nLKM6Do6BvgkomgSGdPyP3XQ5G28Z+BWzA0B1BSub
 rYXj0tXTDJ3l7V8Br85mIUnXNSfJYxPM1Cv3msYXBSTKb9UqtlvL4II4sng8pdHyLUx5
 2HQZcspImeAnOufzc7plFYAj06YhqB91h2pjklOCyjb+EsftBXL9IVLCS0Sefa0pUo3B
 HVQw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUJTSKJMwmBcqYZqo+6vEqZBBR2AlpvtbHdq+aAQ6u8jH4VJSeh+EgpEGxYa+NmjVqIScWfENTlOQ==@nongnu.org
X-Gm-Message-State: AOJu0Yy9opWr/ejS1TH53MlLgaswtGRs9s5Hdr7kGNn8Vbby0WfT09hZ
 Nnm6HzZccoPtVdNqGx4gOTaP8yOr5f/TYrXN40w4JuMV+SaZb7zh8XfB407gzGLbyespmZcHq34
 C60wSVkpSUwzy/+NsP+aX4yMa5OD+c9KSxcJmG1vZ/k7gNfyJkg==
X-Gm-Gg: ASbGnctRBVmd2rWEecSHzjX3FLQhPwYjcu2jDThUijT7zODbGsJVwKwPRjjw9AwvciF
 adZ+uAWk/6fW9nQWBo1CLbWa4rJzGqDvSmGAHpX5wy9+9QFVf5dodyLalRnJD/NkAKwF4Zcu0Uu
 LCGPu79GJblJWwkc44qMW0zohUyNw4O9QSd2z4wU39xsHAZO5MZrBdA3z1XYaSVzvV/PTKfaR5d
 IyJMiQgwFNCdSCJjpoZwerL/e1Xgnfp/AIWagVCT+SW+EP6lhs/DRBEctbJeu6SBZf7JGLNOKlV
 WuSflPlv3lXITqEJXtRt0Q==
X-Received: by 2002:a05:600c:3b19:b0:42c:bae0:f05b with SMTP id
 5b1f17b1804b1-433ce413c8emr26604745e9.1.1732292520044; 
 Fri, 22 Nov 2024 08:22:00 -0800 (PST)
X-Received: by 2002:a05:600c:3b19:b0:42c:bae0:f05b with SMTP id
 5b1f17b1804b1-433ce413c8emr26604585e9.1.1732292519763; 
 Fri, 22 Nov 2024 08:21:59 -0800 (PST)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-433b45d40basm100217045e9.21.2024.11.22.08.21.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Nov 2024 08:21:58 -0800 (PST)
Date: Fri, 22 Nov 2024 17:21:57 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>, Shiju Jose
 <shiju.jose@huawei.com>, "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha
 <anisinha@redhat.com>, Dongjiu Geng <gengdongjiu1@gmail.com>,
 linux-kernel@vger.kernel.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH v4 10/15] acpi/ghes: don't crash QEMU if ghes GED is not
 found
Message-ID: <20241122172157.10012778@imammedo.users.ipa.redhat.com>
In-Reply-To: <d72d9cf99ad0169a39cd3f8028ee7c2e112edf06.1732266152.git.mchehab+huawei@kernel.org>
References: <cover.1732266152.git.mchehab+huawei@kernel.org>
 <d72d9cf99ad0169a39cd3f8028ee7c2e112edf06.1732266152.git.mchehab+huawei@kernel.org>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: LYsO8G6UmSCi_X1WiZOahUzl1FANw07gxF6cNsg0808_1732292520
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.143,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: CihHI5O/2yEz

On Fri, 22 Nov 2024 10:11:27 +0100
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> Make error handling within ghes_record_cper_errors() consistent,
> i.e. instead abort just print a error in case ghes GED is not found.
> 
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  hw/acpi/ghes.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
> index ad7d895def2a..25587f5fc9ab 100644
> --- a/hw/acpi/ghes.c
> +++ b/hw/acpi/ghes.c
> @@ -371,7 +371,10 @@ void ghes_record_cper_errors(const void *cper, size_t len,
>  
>      acpi_ged_state = ACPI_GED(object_resolve_path_type("", TYPE_ACPI_GED,
>                                                         NULL));
> -    g_assert(acpi_ged_state);
> +    if (!acpi_ged_state) {
> +        error_setg(errp, "Can't find ACPI_GED object");
> +        return;
> +    }
>      ags = &acpi_ged_state->ghes_state;
>  
>      start_addr = le64_to_cpu(ags->ghes_addr_le);

