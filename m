Received: by 2002:adf:db01:0:0:0:0:0 with SMTP id s1csp1219628wri;
        Thu, 31 Oct 2019 07:12:29 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwT+3K050HvBdXClc8Jw5wHsh2bg4tvrMUmrPJQa+HeQPpAF6h5l1BJYxqxN/dGASvUy1jx
X-Received: by 2002:ad4:5891:: with SMTP id dz17mr4927076qvb.160.1572531149619;
        Thu, 31 Oct 2019 07:12:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1572531149; cv=none;
        d=google.com; s=arc-20160816;
        b=J68LT+92Oi+jYT3YynZr2xk5eF3uo3nzuIhTLTq96zV0k4d8wYEyY++5/gIZcRWlI8
         rnf74XteCzGgqt5ncaiaXM1sUqviIVpry7LzvrQk7SnLeDTYjdQZMI2gDDxB8hPwPKZB
         S+4fakMo0gKMedjDxYkUUKi6TRktERbsurLMccM6Cpb041E4ti2fLye2+RBSQYZqNEUU
         9gi241b8ie5nESDMTpGB5VEWhZU6dtPBRlfq1urc6rlA2Ce6/gTXuNxi6kwNBQ6NyyKv
         9FGQce1aS4QJsRMh0h16EQ00ESr1heL39GQaJRbQE8xFfQSmhq1PNYiH90kQq7dnRwZc
         71ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=V1gaEy9wcqeS02cr9UZs/fS7CG6P4K+IC6I6/NxjPgo=;
        b=r/AeTrwLYMusvGPxkKpz0/zDLZbmJVIl46UugPRfxVaxf6JA79ZJ2YryYwd83xQwJH
         XR2ovDJzPh/AANSYnIu1ReSojVz6skA/t66ip6EMX+Gw6TJhhWybd98WN3vo89Y6ZNEF
         TvJHIvP+rCtpqdEYVvsBQwrd2308Rq55bbrSkRjm50Rqqc5e28a1FHzuY72jAtlhBz+q
         KceeAyuD8iUdub5PA5pK7Uc94ZAoXZrAjTUFiW62aZgAEoJxLd4YV/zMxqj7FYWnbynB
         tknoLt6gxBNTLxWaklVz9+MtlZ735xzgbT4SEQvji3gFU9Z0ZsFXyv5876WVYmNwqI9P
         fB7Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=E3VAIX5W;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x35si4829058qth.358.2019.10.31.07.12.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 31 Oct 2019 07:12:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=E3VAIX5W;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:50462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iQBBb-0003SV-Kb
	for alex.bennee@linaro.org; Thu, 31 Oct 2019 10:12:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44656)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iQBAL-0001zS-5Q
 for qemu-arm@nongnu.org; Thu, 31 Oct 2019 10:11:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iQBAJ-0002mp-VT
 for qemu-arm@nongnu.org; Thu, 31 Oct 2019 10:11:08 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:26482
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iQBAJ-0002Wq-Ri
 for qemu-arm@nongnu.org; Thu, 31 Oct 2019 10:11:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1572531065;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=V1gaEy9wcqeS02cr9UZs/fS7CG6P4K+IC6I6/NxjPgo=;
 b=E3VAIX5WlBvRZF/RVh1TWi6rdaqJD9WTOMiNtAvqwe04zz2e1q0LmwC92EZsDno8gqtnOH
 BTU7RGzR4rDF9ohckbNM3mg+HzvzZkbmgud14rXrhxoj0uFsWpU6N66i5A/2Hy81TMHlJG
 vn5GwP+eGPhTgJYt7mA3ejqQXVP/vkA=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-416-UuUxGHpnNjuUmpIl5hZkhg-1; Thu, 31 Oct 2019 10:11:01 -0400
Received: by mail-wr1-f71.google.com with SMTP id h4so3400576wrx.15
 for <qemu-arm@nongnu.org>; Thu, 31 Oct 2019 07:11:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=cXjnbC0nat4frL9KT8PDHBjvOMX3WcGx8DlnuviTmr4=;
 b=a/N2KZs9kwpDOdtzBxQeTiSER5ZgXNa3ncUZq8hwre9dfuULQCX3/WXuxo3cgncEHP
 nLuEPR3JKUJh7GdbhWuTYGqpsLrPe9zATKy9vqYoXk5YzOus/Su3CV5pFpzvJLv72oju
 tn8mXF9JfuL9FqYSE+pnLKEPhNNMrIwuVfhYn2/vZu+nFQAYhQPKszZ3jmb/S08k1f8n
 amqHCGG0rG7KqXmGHFAwlk0W1rp/Sy4X/JzCY+scxoQw8oSO5e8YVB7AgXFMWIwdvlJl
 gbT+OLoKCWPbNEyayj0rVz860MKgxJCmLweDYkADnHXOQcgS1CHaucCX/DAqToUcxIBN
 nZOg==
X-Gm-Message-State: APjAAAX4M7FvYaiBwH5+AqBsIU9SicwxnWt3m2xLO9BuXwzi7TIIeYeX
 3CpOuY5r3hF65p8vYNxln6SelzIi/zPoe17QR+itCc2vUcmVEVutCTeEOvmoy7X5Z8AVjxryS27
 a5DG2F+1sAe26
X-Received: by 2002:adf:d183:: with SMTP id v3mr5672750wrc.316.1572531060370; 
 Thu, 31 Oct 2019 07:11:00 -0700 (PDT)
X-Received: by 2002:adf:d183:: with SMTP id v3mr5672723wrc.316.1572531060212; 
 Thu, 31 Oct 2019 07:11:00 -0700 (PDT)
Received: from [172.20.51.145] ([91.217.168.176])
 by smtp.gmail.com with ESMTPSA id x9sm867027wru.32.2019.10.31.07.10.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Oct 2019 07:10:59 -0700 (PDT)
Subject: Re: [PATCH v1 1/1] hw/arm/boot: Rebuild hflags when modifying
 CPUState at boot
To: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
References: <20191031040830.18800-1-edgar.iglesias@xilinx.com>
 <20191031040830.18800-2-edgar.iglesias@xilinx.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <637b245d-4d38-6b24-f118-5d4083accc76@redhat.com>
Date: Thu, 31 Oct 2019 15:10:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191031040830.18800-2-edgar.iglesias@xilinx.com>
Content-Language: en-US
X-MC-Unique: UuUxGHpnNjuUmpIl5hZkhg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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
Cc: figlesia@xilinx.com, peter.maydell@linaro.org, sstabellini@kernel.org,
 sai.pavan.boddu@xilinx.com, frasse.iglesias@gmail.com, alistair@alistair23.me,
 richard.henderson@linaro.org, frederic.konrad@adacore.com,
 luc.michel@greensocs.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QPMXWzYhSZfB

On 10/31/19 5:08 AM, Edgar E. Iglesias wrote:
> Rebuild hflags when modifying CPUState at boot.
>=20
> Fixes: e979972a6a
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
> ---
>   hw/arm/boot.c | 1 +
>   1 file changed, 1 insertion(+)
>=20
> diff --git a/hw/arm/boot.c b/hw/arm/boot.c
> index c264864c11..ef6724960c 100644
> --- a/hw/arm/boot.c
> +++ b/hw/arm/boot.c
> @@ -786,6 +786,7 @@ static void do_cpu_reset(void *opaque)
>                   info->secondary_cpu_reset_hook(cpu, info);
>               }
>           }
> +        arm_rebuild_hflags(env);
>       }
>   }
>  =20
>=20

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

