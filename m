Received: by 2002:a17:906:535b:b0:a20:43fc:1f40 with SMTP id j27csp1034159ejo;
        Tue, 12 Dec 2023 08:44:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHM7dxbNRTEyS6dUR2mrI9JUi/c2CJXRmN4mLMvuKMlAJecua652GLLm2Swjgzlv9mkDgq4
X-Received: by 2002:a05:6871:3a13:b0:1fb:75a:77b8 with SMTP id pu19-20020a0568713a1300b001fb075a77b8mr6483847oac.105.1702399446953;
        Tue, 12 Dec 2023 08:44:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702399446; cv=none;
        d=google.com; s=arc-20160816;
        b=UL8WvZopg+0r3jyTTnUhM/Rxjl+E/kk+r6AMC7894WUwAA2RVq4BYnslVp1aZk1qd2
         T9kgLKzFVAzLhAA3hQP+k+6+hld8L8p/A2f/KNfAMEDDavvPaLthMTDzI6Xrt7cdDfOU
         h4xArNBxoTWvu9C9yl73Lab0K9izGjk62PoYoF/xWuqQXDLpgjL9PtyNwZpqvMxEzk0z
         x/l4pi0c6YkuonAJzUzpGHJA+MOK9lTv9LpWogKoac2UDZ8oyzbu2rgEWRrFcpypLE7T
         8wBXvs8Ln2XHbR0sJfPgnxv0B10tp4Z0tkt6CcYB1/35ZDkFtUZtj3Mqt6PXDsM7U9Sh
         I7WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=80mMrq9q6tWkSoQQCypb8VG9fAJ9L8n8T1QsxloxpqA=;
        fh=oSak0SfGtiLsfNmzdEAK2zLhe/BB9IXTK0i2wATuAS4=;
        b=e/SHMRyJG6gmxmgYDwAq/Zc5TiLuxlJbKh1/ElpS/z3PkX3Wxa11Qr0Lpv4jm88tem
         77XxZVYMMiY0hA/85o42x6XMNhz3v7jcAVrGnZbPYLWFwpGlsRn9GHbEuexTyVL2cmgv
         4sScJE1VE6nP6yeHfXEhyETW+z209KPjx3kLjd8U4FGt7dJbuEqUt+3qG7FmmrAfZPPG
         wEJ5y0rdBYOxMz2EGOHjMjKPybj41Gv3P9TvL+pC29klxLMWifea44pAVDbwx2BPgZ3Z
         +P0gW0P05CDeuKEJ3quX60pboIlOgG1SLSxruJAUJvmP2ApSFFD2ZtVoAHzXdl6A9lQC
         bUsA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lOFzVAeZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id dd17-20020ad45811000000b0067a27cbb5d5si11023071qvb.206.2023.12.12.08.44.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 Dec 2023 08:44:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lOFzVAeZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rD5rW-0003Ny-6Z; Tue, 12 Dec 2023 11:44:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rD5rM-0003KO-SN
 for qemu-arm@nongnu.org; Tue, 12 Dec 2023 11:43:52 -0500
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rD5rH-0004d5-LV
 for qemu-arm@nongnu.org; Tue, 12 Dec 2023 11:43:52 -0500
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-551d5cd1c5fso654948a12.0
 for <qemu-arm@nongnu.org>; Tue, 12 Dec 2023 08:43:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702399426; x=1703004226; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=80mMrq9q6tWkSoQQCypb8VG9fAJ9L8n8T1QsxloxpqA=;
 b=lOFzVAeZ0OV8Wdbw+3ZnUyjhOF+WXNsyyvfpbfJiwmlVx/HlibcHLHWEROElQju6wj
 r6XxpBm4lqtson4yolY/Cb+7kBPO2kNrdFWnkFUv8Zm/4l41pQpHh/nQnIjzG+Ow0gwW
 fiJuHkxd0TeJx9TDWaLnOcoGe59noPtzbB/Tb3XRCb6xPK5rzVdRzVipzOfgwAz4IIkf
 tZRjQfq/r9+HpVkCzFhfpXC4yESJV2oStznJQqKDkxIFI7K05IQVXbPsTqE130/crCu2
 E6ybvoYy4WGQx957eHergWGUGpM8ZRsfDHx2CYY7UuWL2wbsjGlF43LvnEadZ9G7PkTp
 Rv+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702399426; x=1703004226;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=80mMrq9q6tWkSoQQCypb8VG9fAJ9L8n8T1QsxloxpqA=;
 b=bqmALw8mIdy12Fxt5SAFkhW0TT4kJEfPcUYzKce6tWrWEnBOOUVFYMAuGoBZV6fA9i
 ZpUzOR4sJc5ELucWjrD5Um0DUL8hxTQNi3+Cft5edswEqF77IANlv12c5N+cMMk741R9
 YTqo00arGKUcEaXfe9RD7BZhVTNJFMImsmRg9nVYrMuzvjdKOlG4qb8wbt50aU/h9TSE
 BrZNe0IknOGpzxMbkmvfcHpzYujjL18D5arPTUVyePC/PtLcYs6FTG7LhQE8r8up89Fd
 NAPDZRfF79ubkBFjuyVc9/lZxzhQrvN4idW4gmAxrdFJ4w/xXLRNiVZj//a2zCrtOWqt
 jX/w==
X-Gm-Message-State: AOJu0Yywh/FZiNizySRgBltwMSNL3GxJcgsCHBI2siG/cB9bmVUYsC5Q
 hJiJAbXhSQM9DYLqx2br/x/Ck+XqoLuX2ole1OTipw==
X-Received: by 2002:aa7:c484:0:b0:551:e56b:6e9 with SMTP id
 m4-20020aa7c484000000b00551e56b06e9mr184050edq.19.1702399425960; Tue, 12 Dec
 2023 08:43:45 -0800 (PST)
MIME-Version: 1.0
References: <20231123143813.42632-1-philmd@linaro.org>
 <20231123143813.42632-3-philmd@linaro.org>
In-Reply-To: <20231123143813.42632-3-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 12 Dec 2023 16:43:35 +0000
Message-ID: <CAFEAcA8Y30eetSWcQmrEiDS81cGOg3nLqh0DDXXcrjgTrUs8Lg@mail.gmail.com>
Subject: Re: [PATCH-for-9.0 v2 2/8] hw/arm/bcm2836: Simplify use of
 'reset-cbar' property
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, 
 Alistair Francis <alistair@alistair23.me>, Joel Stanley <joel@jms.id.au>, 
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, 
 Ani Sinha <anisinha@redhat.com>, Eduardo Habkost <eduardo@habkost.net>, 
 David Gibson <david@gibson.dropbear.id.au>,
 "Michael S. Tsirkin" <mst@redhat.com>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, 
 Andrey Smirnov <andrew.smirnov@gmail.com>, Tyrone Ting <kfting@nuvoton.com>, 
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>, 
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Aurelien Jarno <aurelien@aurel32.net>, Igor Mammedov <imammedo@redhat.com>,
 qemu-ppc@nongnu.org, 
 Hao Wu <wuhaotsh@google.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
 Beniamino Galvani <b.galvani@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Nicholas Piggin <npiggin@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: vExsLbF2Os7a

On Thu, 23 Nov 2023 at 14:38, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> bcm2836_realize() is called by
>
>  - bcm2836_class_init() which sets:
>
>     bc->cpu_type =3D ARM_CPU_TYPE_NAME("cortex-a7")
>
>  - bcm2837_class_init() which sets:
>
>     bc->cpu_type =3D ARM_CPU_TYPE_NAME("cortex-a53")
>
> Both Cortex-A7 / A53 have the ARM_FEATURE_CBAR set. If it isn't,
> then this is a programming error: use &error_abort.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
