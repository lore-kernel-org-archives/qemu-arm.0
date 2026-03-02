Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 519B1EB3624
	for <qemu-arm@archiver.kernel.org>; Mon,  2 Mar 2026 17:55:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vx7UM-0002fo-4K; Mon, 02 Mar 2026 12:55:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vx7UI-0002fI-5F
 for qemu-arm@nongnu.org; Mon, 02 Mar 2026 12:55:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vx7UG-00058O-3l
 for qemu-arm@nongnu.org; Mon, 02 Mar 2026 12:55:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1772474118;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=W4gQk8QecJuRa1tkH06kVi6OX9PtCJJH23dwgKUWPyQ=;
 b=c8hHjq9cgyBdwUy9yYTJfRv9Fu9VXO5asXv7/VUd34gY26QER33tgF7RRlEWe93bchMrz4
 iew3Li0ZDFyO7JJEl6L4J/lB7oGDjFHN3fMNmRhbvpstYdnOtaiWDC96LgQ+ziU8xfmiOO
 MFH6ZnP98m9FHApE0V1Iodv0XLW7PAw=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-110-wQzCRdheMJa1tgdWJRzzUQ-1; Mon, 02 Mar 2026 12:55:17 -0500
X-MC-Unique: wQzCRdheMJa1tgdWJRzzUQ-1
X-Mimecast-MFC-AGG-ID: wQzCRdheMJa1tgdWJRzzUQ_1772474116
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-439b699b9a6so1083546f8f.3
 for <qemu-arm@nongnu.org>; Mon, 02 Mar 2026 09:55:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772474116; x=1773078916;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W4gQk8QecJuRa1tkH06kVi6OX9PtCJJH23dwgKUWPyQ=;
 b=MgY+be+xH8pvzDMEQDVnUc3MbVLqL1ZlvaRv3CIIWcHtqMGAbU0FBjCqQbsFME3+dQ
 bUKNrca5s7y3Kk26Dx1kkO12OsaSg+C/bBbqPRuOzdIXsx+Jgenl2gZsH+rxfgU8Xwtn
 bwMi0DawZmStlqN7nl3saluQkj/A3OJkh7u0c6xDhI/Tq2O638pZ8w1muKmcbVk2nMgi
 ToES5pQFkcnrOYZQmr7HauJ7NBQajZNxlRCYOfueEv8DaglswWYGKIyzf8qtXKlDsvOQ
 s6Ai7jMTzE2qVZ2X4dUCnX8wwbxckU9GiTNdNGEjrlVymy2MPNJGmREo22dHXBCXCoRd
 XBpA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXXpLh6yNeaekmvVrQoVRM3L3ySZ4GPo86aTFZWicEQrmMBry/kueMVIeRub2q4B6DNDGQ8MYUbug==@nongnu.org
X-Gm-Message-State: AOJu0Yzn7dTekY0YDSSq9x4+1sEzC61cxFAUlw1pWy+G7JTcW0e7707c
 C4nRqeSsPpNnHNea8IPtMwwQ5gijVuoJpiCanNglXj8MzL/hFE4DTj7GgP08t4kXU3b7hGJLx+G
 EFjkGhlgjuBXn1PhfNNyOeRDNZg5lSjlyeEzuDwIChJn3vlnRifwLIg==
X-Gm-Gg: ATEYQzzOJzw6n39hg9NiyVo+tLXraeWOfjC49OrhcxSNYDjBI0e4JBdlCsIxAYG7ydP
 8PwGads+Rxd3WZaYxvZZvM9bNnWDO6qaM+VCsqw6D1h4BHai61FADXPhl+2Z5+4Xn4WAxikyPMo
 lwYWsP3BaHkn1WN53ZcLoNakk2Wg62qvc3AnyXLp9g2j+PUPDdMeqXjoN9C7wDv0FiB5hU4Kqc8
 7BQIZfabomVVUPZA7yB9ChCHcdMHPSjJYmyn9r6rWkYCfaSi+lGISFrToUg/7U+g9/s5HVVPyFS
 z7e3bFgk0NEal+iP50ydOXI8JAqF/tCwmaQvlv2HAkQLB44voHH7letibrYijvlVd98OIz/cAGg
 T10F7OsecmaZRozWjiQwO6LI9x/r5wk1ZcU6vjFoINsafjYZsyn1VWRbP16e9uZN+RpCT6g==
X-Received: by 2002:a05:6000:2282:b0:439:9124:f2b7 with SMTP id
 ffacd0b85a97d-4399de20546mr22885976f8f.29.1772474115846; 
 Mon, 02 Mar 2026 09:55:15 -0800 (PST)
X-Received: by 2002:a05:6000:2282:b0:439:9124:f2b7 with SMTP id
 ffacd0b85a97d-4399de20546mr22885928f8f.29.1772474115427; 
 Mon, 02 Mar 2026 09:55:15 -0800 (PST)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439b503425asm10686569f8f.25.2026.03.02.09.55.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Mar 2026 09:55:15 -0800 (PST)
Message-ID: <981bafba-6041-4b27-a015-d9764950f929@redhat.com>
Date: Mon, 2 Mar 2026 18:55:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v4 19/31] hw/arm/smmuv3: Fix CFGI_CD handling when stage-1
 is unsupported
To: Tao Tang <tangtao1634@phytium.com.cn>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Chen Baozi <chenbaozi@phytium.com.cn>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Mostafa Saleh <smostafa@google.com>, Chao Liu <chao.liu.zevorn@gmail.com>
References: <20260221100250.2976287-1-tangtao1634@phytium.com.cn>
 <20260221101733.2995020-1-tangtao1634@phytium.com.cn>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20260221101733.2995020-1-tangtao1634@phytium.com.cn>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 5GJxGKCNhzNOIA0r74YRv37-UZIU3Z1EvVcYT75w-4I_1772474116
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.968, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.495,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org



On 2/21/26 11:17 AM, Tao Tang wrote:
> Add a STAGE1_SUPPORTED check in the CMD_CFGI_CD and CMD_CFGI_CD_ALL path
> and return CERROR_ILL when stage-1 translation is not implemented,
> matching the architecture requirement (IHI 0070G.b, page 176).
>
> Fixes: 32cfd7f39e08 ("hw/arm/smmuv3: Cache/invalidate config data")
> Signed-off-by: Tao Tang <tangtao1634@phytium.com.cn>
> ---
>  hw/arm/smmuv3.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index fa09099a09a..d4c58c0c724 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -1461,6 +1461,15 @@ static int smmuv3_cmdq_consume(SMMUv3State *s, Error **errp, SMMUSecSID sec_sid)
>                  break;
>              }
>  
> +            /*
> +             * This command raises CERROR_ILL when stage 1 is not implemented
> +             * according to (IHI 0070G.b) Page 176.
> +             */
> +            if (!STAGE1_SUPPORTED(s)) {
> +                cmd_error = SMMU_CERROR_ILL;
> +                break;
> +            }
> +
>              trace_smmuv3_cmdq_cfgi_cd(sid);
>              smmuv3_flush_config(sdev);
>              if (!smmuv3_accel_issue_inv_cmd(s, &cmd, sdev, errp)) {
With the fixed fixes tag,
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric


