Received: by 2002:a17:505:1116:b0:1be9:327d:8ee3 with SMTP id pu22csp516253njb;
        Sat, 24 Aug 2024 06:16:43 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUq5fk8vj99thCnnhp/pPvP6UNeUepbvqo0MEssC4N4fD4gWYuLYPM1r1/Q3UdjwesyHzZ633YoLoW9Sw==@linaro.org
X-Google-Smtp-Source: AGHT+IHRxJ3BIn61G0x2xfcxM6qZZEx1y4pfjrh5fDWDGCfhSsCMDDuO7WlVqIbcwRTePsQYZsv8
X-Received: by 2002:a05:6122:31aa:b0:4eb:12da:14c7 with SMTP id 71dfb90a1353d-4fd1a53134emr6146041e0c.6.1724505403225;
        Sat, 24 Aug 2024 06:16:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1724505403; cv=none;
        d=google.com; s=arc-20160816;
        b=f5xhDxLLJwToXaxzztw1Xc9rMwqs5d4twadDIq9kwFYgPJ81ahM7vuw/U3f9p2wdqA
         k1ba/NNnCQTL0F9ns3DgUsTIo67ltZbSKpk5LcmUPnv9UE7zvORQynjUB6pXBBEvoz+B
         VsToR8jyzDWQnZsRVACrS+PLdWUv306zsJbCZzYqmwKsnfbueiCvo1B9WFz2E3XqSJKO
         83p/MjrfhlpeeHVhgQNt3gmMfznJEibgFA121lwSZy6sQPwJUZjY1LrjMAUxH4sHe4yK
         X9PFexkLSxPh26HoWVPhT2QA9cWd7j3dAya6R0G2CQDnZJ9cnTaVwO2EG435SqSbAa2n
         mzcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:date:message-id:subject
         :mime-version:content-transfer-encoding:from:dkim-signature;
        bh=fAqs0ECsiFQlSCVZu/ugMOaFaYc0+lr21RYPQX//IdQ=;
        fh=DBwo5oYV+Zl89FPcGyBzo6mnqwnGCoM6YpiQGc4/RNc=;
        b=bnEZvDkMonNevXg/drRbifx8zyhPe0qVUHWBZrL7B47FURAeshPq+A3jrwWyXjKe57
         wgHcs92JS+6lPQOZyk9hCUcst7op6wFTqV9+L0Ztiu/+Mu8y7O5nEuGi/V1jAJclRy5c
         56J8mozWYFd2Msn+b1nMmnUFSFs+i6cLGO0IZKRhwvwKciWjKdHthLufhJAJ8pUe+vYb
         qMJWXYRTJXhhPcTaW3V64tkeoKreKBxKEWqsaID3zjL8NEt6D/GYq80rzS4juAuIWPuv
         fW5w8njJW6PN68O61ERa9EHHokWWMJiiswX72rOKQZ+dkSZTb1WlhNhuEznw+1J0fQ3k
         oyXg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@oozlum.co.uk header.s=google header.b=PRaHGd5F;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-498e47a2ceasi1467013137.20.2024.08.24.06.16.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 24 Aug 2024 06:16:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@oozlum.co.uk header.s=google header.b=PRaHGd5F;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1shqd4-00026G-EH; Sat, 24 Aug 2024 09:16:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chris.smith@oozlum.co.uk>)
 id 1shqd2-00025k-3c
 for qemu-arm@nongnu.org; Sat, 24 Aug 2024 09:16:28 -0400
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chris.smith@oozlum.co.uk>)
 id 1shqcy-0008LP-59
 for qemu-arm@nongnu.org; Sat, 24 Aug 2024 09:16:27 -0400
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2f025b94e07so26057591fa.0
 for <qemu-arm@nongnu.org>; Sat, 24 Aug 2024 06:16:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oozlum.co.uk; s=google; t=1724505380; x=1725110180; darn=nongnu.org;
 h=to:date:message-id:subject:mime-version:content-transfer-encoding
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=fAqs0ECsiFQlSCVZu/ugMOaFaYc0+lr21RYPQX//IdQ=;
 b=PRaHGd5FpMoSh8yOrJyC4d86fKXTw4lVaLCcP4wMqO6B3DMvrlDIcafLr1xggejORL
 67YZZjR5GFY9pk/j3XOT5yR/uK1fUauYB8F+zv87AP0ihS9fDe7FLQs47JW6ZL51/zKt
 TnKoN+ruhvxLLBySZFJagfEvDY4WpZO35kJn0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724505380; x=1725110180;
 h=to:date:message-id:subject:mime-version:content-transfer-encoding
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fAqs0ECsiFQlSCVZu/ugMOaFaYc0+lr21RYPQX//IdQ=;
 b=Di3xT+9aKbUpSm+nQH9CsevBHDBdPak41D/yI/KvmzAyTEPEMVO85C9CdXFbCUaYRQ
 0vQm3Ye2cgYTnykuhQ82++Qpd6TDT9euCx1Ot59EAF2ApRz4yuyTrGFLqPMGm5HeCpMj
 VmL0lN4cI8OljG0m6rZDfASHadDfk+YiVnP/ZlEcpKqe+Elk5I47J9J9viERd4D8UUlJ
 W8GyGB3rYkr3eysJe83rs6z1lK6BjA9Ti4SpXBODdFR5e0eT1BbyR2LH89L2ZalAYc81
 XV846FDE2L0LZppdPoLtdJjTf4JZt6IhW35bycFCuspk9PXduzWISVeRUTnEvlzQ6Tcf
 nQhw==
X-Gm-Message-State: AOJu0YzDhP+mscekmX4ox3hX2hwIG3Hy6diLUx3mDel2OtjtPdC17tCX
 pwPq+VrIrzGsTy0Snbnnqa2PICKXVyHynnJGVO08PUWPs4+rV+oSyre2QhthFxXyo257sEXUezK
 t
X-Received: by 2002:a2e:f09:0:b0:2f3:f168:f91 with SMTP id
 38308e7fff4ca-2f4f4901b42mr40134831fa.11.1724505379849; 
 Sat, 24 Aug 2024 06:16:19 -0700 (PDT)
Received: from smtpclient.apple ([95.147.43.13])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c04a3eaa90sm3268290a12.45.2024.08.24.06.16.19
 for <qemu-arm@nongnu.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 24 Aug 2024 06:16:19 -0700 (PDT)
From: Chris Smith <chris.smith@oozlum.co.uk>
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3776.700.51\))
Subject: Versatilepb SD card not registered as a block device
Message-Id: <C017D7F2-CDE1-4FB0-BA05-3E4D00480293@oozlum.co.uk>
Date: Sat, 24 Aug 2024 14:16:09 +0100
To: qemu-arm@nongnu.org
X-Mailer: Apple Mail (2.3776.700.51)
Received-SPF: pass client-ip=2a00:1450:4864:20::233;
 envelope-from=chris.smith@oozlum.co.uk; helo=mail-lj1-x233.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-TUID: 0x3J7/vgYvvJ

Hi,

I=E2=80=99m using qemu-system-arm with versatilepb machine type to =
emulate an old device with a 2.6 Linux kernel.  This is working well so =
far, but I am having issues when trying to add an SD card to the =
machine.  I can see that the SD card is being added by QEMU and that the =
kernel=E2=80=99s mmci_pl18x driver is picking it up as =E2=80=98fpga:05=E2=
=80=99, however this doesn=E2=80=99t then seem to then be recognised as =
a block device and the relevant /sys and /dev entries are not created.

On the actual hardware the SD card is registered as 'mmc0:aaaa', so I =
tried a trivial text replacement in the versatilepb kernel sources from =
=E2=80=98fpga:05=E2=80=99 to =E2=80=98mmc0:aaaa=E2=80=99 and while this =
appears to work superficially =E2=80=94 the driver now detects it in the =
boot log as =E2=80=98mmc0:aaaa=E2=80=99 =E2=80=94 it still isn=E2=80=99t =
recognised properly as a block device.

I=E2=80=99d appreciate any advice on where to look and what to change to =
get this to work.

Regards,
Chris=
