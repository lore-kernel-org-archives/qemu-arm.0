Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp3056738lfm;
        Mon, 13 Jul 2020 01:07:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzSD3gHksOs+7GQ055klWggT/LbkaycIrfF3p0mjw2I8PtJsa3zCGi7R856711HtKVL+X2L
X-Received: by 2002:a25:18d7:: with SMTP id 206mr9051327yby.473.1594627635353;
        Mon, 13 Jul 2020 01:07:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1594627635; cv=none;
        d=google.com; s=arc-20160816;
        b=GhleGK7g6P8VPxuc8P6tdgfgp4imeTIQlX81qUS32+7yZz7dKj6oUSgskO2vF7OGoX
         zyMK8ETg2yPf0yz0VPN7Iv2qK198xSoxgCqcSFZ7PbRJ7LmdY4D20OsQ+uq3CRnX2iA5
         v+HIJesXcYd7n5f4LGrDpnE1NGyhp8n3Eg+yhj3mpKy4swdGLg2AOhLgBv7aySW51zWS
         XeFmHqnri0RjIileSCuw+TL7Ba7mdGVmFDApNs0J/LbwqRhB5RaY3S8WtZc+sgVBq5jB
         w12ErGIvecPVwM/axJjwEcA+AIC63H+vzPols6MigfxvgwG5DREkDz0ij6exN65HnAMD
         FzMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=u3c6nzETiRerzsAAkRnLd14naRzeIdzULOJdcj7F5N0=;
        b=UcrSGRJ5OzskAZT6KzyE6ZGibb8AE/n3LWOLmyUb5e6geDG39+vK7SLA0aIkJFffxp
         r4hr0dgOp0ZtFK05Y2rtS17CkCdp1iw2eyTsskdONJrmCgeugr4aJFjOpM2Wx30R02P0
         pAGuFFoxj+0kfYL5ohxMGCNb4V/VEoRvMMvxMde/jq/pVJiNTQmllRRrIL1Xs59XdtQY
         2pHp1hdwQTMkf2CHISIsHVQ6ufqiskorrMJhfa4XlhzY9laHqPTtVi4KcQBF5T+FMZfF
         nRyXb0VzoVV6VE9oLYFBL0RKTnpjkQAAAR2LiF9UMydF61e99P4lFUfYaNWR8Na6sw8U
         /S4w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=MHEu0COV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x9si14521829ybd.306.2020.07.13.01.07.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 Jul 2020 01:07:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=MHEu0COV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:41736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jutUY-0004Pr-PG
	for alex.bennee@linaro.org; Mon, 13 Jul 2020 04:07:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <erik.lucas.smit@gmail.com>)
 id 1jutUS-0004Pi-TZ; Mon, 13 Jul 2020 04:07:08 -0400
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:43154)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <erik.lucas.smit@gmail.com>)
 id 1jutUR-00041b-CT; Mon, 13 Jul 2020 04:07:08 -0400
Received: by mail-oi1-x242.google.com with SMTP id x83so10257399oif.10;
 Mon, 13 Jul 2020 01:07:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=u3c6nzETiRerzsAAkRnLd14naRzeIdzULOJdcj7F5N0=;
 b=MHEu0COV9uxYHK8bkFedzbidnkUddVP/86HvKo/C6lYUfiKE12knI5HKt/FymvcAKF
 1T0Chc7MQe0QPWlpea/RKitpJCGcrnuHPyy50gVlgGUE8yOBLF2VenyjGZaU1M+fk7xG
 BVtBT8ICD/xG4dqLFJaq0R5wSDK3EX8F1RHG92Mvgt6m7egQakPBJyJQo0RC0Tyk1Yz1
 7NhIF8aBOLNxrroNx6hVj+iFSWNLLRteZYZ3gk/W03oVh5ROSholtUkfESt/I1WHsdgg
 nDkmjvXwUCTHQx7pqFtlN1DIBbI/19s68pcwG1zOcdDO2o1VMBk4LX3zDs8YGJqcpIia
 Vomw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=u3c6nzETiRerzsAAkRnLd14naRzeIdzULOJdcj7F5N0=;
 b=aelvZkG1pCc61UviFn20I0aHvTqFHnPqGVLKinsOvup4enkZStC45sJLtTQBLvO/tj
 cJhjyP84WoQl9F50dBlVRhRNVDZEiDI+mmb5p3HQeRTht+WVpul6nUlT4Zn1OuMST2je
 jmyVGdzaLuHeGFoI4IwjYv5a+HdxawKnCjaWDBIfZ5tJtU396rNf2+PUKOo4d2PjuIIa
 LmpRO57eSufzAvCSxLovjs47hMs2G0n9GjTBGC1pbtGqAGMSlDI0Kk2RhK6xzQk+0SCK
 vo9kYBVlWo3Dof5Iu+pEWiL3VjBMnt9Q7Todcvkn4zGA+DgUOjzUpnYs39feE9XmfzzM
 SoLw==
X-Gm-Message-State: AOAM532IuXTEof4qirbPG3LibWKtT1u5OmQgLg6klkqKSPsUla0LP3G+
 +fO6L+IpawDvt4cc2K0ck42pAypMZ/mVJueY2HGpvj23IvI=
X-Received: by 2002:a05:6808:a19:: with SMTP id
 n25mr12349271oij.84.1594627625317; 
 Mon, 13 Jul 2020 01:07:05 -0700 (PDT)
MIME-Version: 1.0
References: <CA+MHfoubt1g2FzcjTw3a0vNr7X2T8Jb+nYoc4_x=Z2TP51afKg@mail.gmail.com>
 <a7acba46-5a9a-5dd2-71c6-7e4586485823@amsat.org>
 <CA+MHfot6FdS2yT0mEsCW36bCfwy-WY-1KPQ-KDfYBKzTy=Gd7w@mail.gmail.com>
 <CACPK8Xdqr+EufMgooCY=D+Vt98qu11YTHE5Fzi5+xqX=wKReeQ@mail.gmail.com>
 <CA+MHfouin6Zmz+GrjWRCc_WzPF=ff-z_5V7BLv0HkL+SW9bRoQ@mail.gmail.com>
 <8879bfee-752b-c4e2-7646-c42dec84a440@kaod.org>
In-Reply-To: <8879bfee-752b-c4e2-7646-c42dec84a440@kaod.org>
From: Erik Smit <erik.lucas.smit@gmail.com>
Date: Mon, 13 Jul 2020 10:06:54 +0200
Message-ID: <CA+MHfou6ijtwjzWye6CKaqTa4sKxF1WmgH9juaSdO344uP2UZA@mail.gmail.com>
Subject: Re: hw/misc/aspeed_scu: 5d971f9e breaks Supermicro AST2400
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::242;
 envelope-from=erik.lucas.smit@gmail.com; helo=mail-oi1-x242.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zu74O4pUQom1

Hi C=C3=A9dric,

On Mon, 13 Jul 2020 at 09:52, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> With this patch, the supermicro firmware boots further but there is still
> an issue. It might be the flash definition I used. The machine is detecte=
d
> as an AST2300 SoC which is weird.

> BMC flash ID:0x19ba20
> Unable to handle kernel NULL pointer dereference at virtual address 00000=
000

The firmware is expecting the flash ID to repeat. The following makes it bo=
ot.
Not sure if this is the right way to go.

diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
index 8227088441..5000930800 100644
--- a/hw/block/m25p80.c
+++ b/hw/block/m25p80.c
@@ -1041,7 +1041,7 @@ static void decode_new_cmd(Flash *s, uint32_t value)
             s->data[i] =3D s->pi->id[i];
         }
         for (; i < SPI_NOR_MAX_ID_LEN; i++) {
-            s->data[i] =3D 0;
+            s->data[i] =3D s->pi->id[i % s->pi->id_len];
         }

         s->len =3D SPI_NOR_MAX_ID_LEN;

--=20
Best Regards,

Erik Smit
