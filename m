Received: by 2002:a17:906:535b:b0:a20:43fc:1f40 with SMTP id j27csp1042013ejo;
        Tue, 12 Dec 2023 08:57:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHl+2oXSyzT2lxrZAguxyjC7mE7deyNKsQypq4Gpq3S05o4YWlJh7d0VeaoJ3nhomDyA/ph
X-Received: by 2002:a05:620a:4728:b0:77d:a29b:336d with SMTP id bs40-20020a05620a472800b0077da29b336dmr8515931qkb.11.1702400226045;
        Tue, 12 Dec 2023 08:57:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702400226; cv=none;
        d=google.com; s=arc-20160816;
        b=jxK9s2YjxesN4syE98zIecTQLxVG8pvYhZoSTnbu0XIngojCMX4NKqvzhEImu3d+AE
         L+YjOx0M1nj0EZhzK70ueOdlhFg6rVI0bhADQavngniB/BNbhDz4o1DC+zyAPYTOrQgC
         EJJXftBnMfkCF3NtPTYfKA6iciBhew9uMxmA9vMz8wqwpPSRWC4CaaFZVVe8XoQTxa4X
         c3yNX4UM1mtkLWRx23SK4ks7FU6BwEvk+aZ+iUbbTCM6AeOCGhVYx5FrlCAbNRpa/Cnz
         1l3RW98VZ46ynvJtzGtgM80UcHByVKSNI8tcOAt0cDclM3jvKb5U5l3a9gaeNqNirjWZ
         65og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=qR8gziIv2UNheMz0M1zhqTx/v25K8xFMMJfI4pJMb9A=;
        fh=oSak0SfGtiLsfNmzdEAK2zLhe/BB9IXTK0i2wATuAS4=;
        b=NZr0pRKZtqzvUqKjTLDAAjIsAA54OIB+z+sog2yFEFbOmLwS7jjFQZ5FlP3Ykotd5r
         0f4xiFqd0Y+2SQCt3SeoePhua04bQ4xTS3dSUkfBLEeYM1dq/6oZnQ8cWAfsLd3ss8A5
         jlasF+990+wcTgPV+2FSCnRif/4JtaAh/o/uLGenMfHXm2S+pFvjLtLUyAoWVxef2vJ+
         MHRFvycEu/r3b/Vgyi7uIDWp9rZoB66IuA2ZgZVmGBecDZYoTcdXhqsk8jxOJSGHGIrA
         aw4WkhXSp00vPsk+aVoLrdOmGgKsCRMlpqqufrYUchJucxEt0Hj3i93Rft5V4s133XsF
         fD3g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NYk37VLI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u16-20020a05620a0c5000b0077f25ec0ad0si10621790qki.553.2023.12.12.08.57.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 Dec 2023 08:57:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NYk37VLI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rD63y-0001Dr-OV; Tue, 12 Dec 2023 11:56:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rD63x-0001Cw-CI
 for qemu-arm@nongnu.org; Tue, 12 Dec 2023 11:56:53 -0500
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rD63u-0001t0-Sp
 for qemu-arm@nongnu.org; Tue, 12 Dec 2023 11:56:53 -0500
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-548f853fc9eso8098880a12.1
 for <qemu-arm@nongnu.org>; Tue, 12 Dec 2023 08:56:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702400209; x=1703005009; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qR8gziIv2UNheMz0M1zhqTx/v25K8xFMMJfI4pJMb9A=;
 b=NYk37VLIPyd9EN7UzqA3l5SRRp7HyJ7vsrt4gKTPTWoKLZUGV0kTkA2UemvKJAARo7
 /r+ojW0H2Bw+K8wcLFnBtFks+LAjZo52z7fd0OafJ1lykqlHQPbQL+FhMRrwYpw8i/Bw
 IAao0GjvPGQZegn9erQnPQKLHP1Pvq54H/qXw1qopk1SHiLf3vDbAIpwEgibjAdkm3IN
 68QJsfy8PKKTiRAH5qVK1YBLZddns9qTI/FEM61cBPvHKVVD2oZ/c1vRnghA6l0Ar6MQ
 iRDVqSWp+Z6V0o0TP+OrKNr06BJvhLU5bRngnML3v/KxOJH93Z5EH3nbIphMpm5oiDZ3
 fYLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702400209; x=1703005009;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qR8gziIv2UNheMz0M1zhqTx/v25K8xFMMJfI4pJMb9A=;
 b=tDp8ury8NrMkdkhBvIJyf+ry6TPCP+MuxTj6ZneFeLJNQGmjM/au0hJJE6Pzoa3DT4
 UFGYtpzD99fqv/OGYygdbxyosOEYxTVsF7K1YcER8R0T1SQxoHGo2zp++sjriGOi+HbC
 VtAmMfbVRW2r0peQIv4TiWW6MYg+tqyhp9FLgYmS4DEcPYkB4xpZvdbxlu1fwVGwh1kV
 FRa95OL2DRFSEnlDFAVfzHUZNLSSXvwueP5Ru4fUkOxiZe1XaPfAhOkmp7m6Wu38QU3r
 3B3b+94+U6l3qKkPU+hpE04R+nQHVkUFg6OzUANnqCnC3ljbhPvJAFNMfmcc8P9rnEah
 /fgQ==
X-Gm-Message-State: AOJu0YxOcNvzUsuda8L3GtShdt0N+DEdhP14YwvRW0wFaN2E4oKHXYxv
 W16lUv0VXqNbWPHXorXzu9GvghQYfqZjO6yNvlj2kA==
X-Received: by 2002:a50:9b5c:0:b0:551:8766:7296 with SMTP id
 a28-20020a509b5c000000b0055187667296mr414921edj.105.1702400209257; Tue, 12
 Dec 2023 08:56:49 -0800 (PST)
MIME-Version: 1.0
References: <20231123143813.42632-1-philmd@linaro.org>
 <20231123143813.42632-7-philmd@linaro.org>
In-Reply-To: <20231123143813.42632-7-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 12 Dec 2023 16:56:38 +0000
Message-ID: <CAFEAcA9tP+Opy0MHtHtpZa2q=ktY5vVaGZDFfMxatjT+-7E1xA@mail.gmail.com>
Subject: Re: [PATCH-for-9.0 v2 6/8] hw: Simplify uses of qdev_prop_set_bit(dev, 
 'start-powered-off')
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
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52f.google.com
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
X-TUID: 1c8IqDhN9qOh

On Thu, 23 Nov 2023 at 14:39, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> Simplify few qdev_prop_set_bit("start-powered-off") and re-indent.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
