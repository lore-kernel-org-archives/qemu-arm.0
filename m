Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D60EECD98CF
	for <qemu-arm@archiver.kernel.org>; Tue, 16 Jun 2026 08:46:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wZPQW-0006nC-Ft; Tue, 16 Jun 2026 04:45:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wZPQT-0006lZ-CY
 for qemu-arm@nongnu.org; Tue, 16 Jun 2026 04:45:41 -0400
Received: from mail-yx1-xb135.google.com ([2607:f8b0:4864:20::b135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wZPQQ-0007pA-KD
 for qemu-arm@nongnu.org; Tue, 16 Jun 2026 04:45:40 -0400
Received: by mail-yx1-xb135.google.com with SMTP id
 956f58d0204a3-660e9fef1d4so4548993d50.1
 for <qemu-arm@nongnu.org>; Tue, 16 Jun 2026 01:45:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781599534; cv=none;
 d=google.com; s=arc-20240605;
 b=XZUuCIG1KeEp05xYlRtrH77Wed7l37lMbyK+0uotk3cgdmDKYCeOL6rO43TBloUZbp
 xXisFfdEe16yUe2/EGV0RvqnFZZYO/t6frubhfYXzP1QKqsKK89l6Ul6w7LZ4IoOwkvs
 CikgdJa5YpQzNtSQrxnuz3iFyDbwSlLsAoVEypEiBqLC8e5H7z8GbXjH9RZmc2LNMEgy
 H1J6MTM6DsgPhv36MAu02YfA24BzcyiwU2Y1c0q7PgjVQZsSd2Ol0EtNznLRWsNKZhPA
 XayY6YRnEII/wy4rRlFv4hFFolx8+E00W0VbG9mDZ9SoVhibazIim9kwsNDQgXKEbgez
 lERw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=hLs5067oWnPkMIcP3oQvJ6cEIENiZFuK3UVjpv4V1r8=;
 fh=0Mes3Ni4WXj48sF/vmWPtbf2ffCzpItYGAyaYkdQM24=;
 b=BOGo88O7JQtYP310aX8EdPnoR2Rb7E5pL1H2akH1bpawoml5NM+ikpPwywwXR7Yw5i
 qxJpIN9Tj3PaPVfDiMgnp/UPEo5Ietk7TENcA8fyg7PBcOjnhuQz2L5Yl/kb/woCMTM9
 o4S4DiYpI8QBr0WpATBDTEJ+wJGF+jznvwJ0I48XqPPO4Ed/UYeE9XlxgiRk2RYJYNUJ
 gXpw87pJ9jHnMFQITAjaeG2id4MRL8m5dEKsIcOjlz+9shbTs2nwNv79HJjezlWw2Fm9
 pZYExlup+mw/mrju+F5jFJvCswqPbPPMFf5uAh5szMF4UQDB4SUsyIJbvHDRlbBeXFKk
 EmhQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1781599534; x=1782204334; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=hLs5067oWnPkMIcP3oQvJ6cEIENiZFuK3UVjpv4V1r8=;
 b=F36GYyDILQme3FZMCsyfvVdqu+awyEWNcgJ2nU3KEZXdYCAHHga+RiHQG+Wep5Hfa3
 kzdUyNT+dkl49B5+dqaVtdPsCRdygWSXiAWnYoa4JMQ8hMPthMWfJ+Hsz+DjXfDmpqaA
 pANGVIQkDWyg73ugj3Uv/T9Zsk97ZpgHzc0kSS28V3KS2+0sjIocaIJi8mQ2lOucA6ZE
 9WlkW1xSQV2dgptzgFTbtEWz0FpGplOhwDlbUu4WxPjod4MPWbJ6ZKgX3wqlB/DEt+5R
 vBRmj3jU1uaducXw3PEqW16TUAnzUh84hvMd9ncUCDz427WIW4FB0bWE7+1snHRCZnBE
 XfSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781599534; x=1782204334;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hLs5067oWnPkMIcP3oQvJ6cEIENiZFuK3UVjpv4V1r8=;
 b=Ge/PaD0SwhgZxjP+rpSatH297B7HP0YgtwgKeGVr67+7PT4Cg7nWxl3DkxQoYZhvkT
 wB7wNlP6lK8jdccBo+QN/Lhde8GCo3Jt0Y1uSNfQhqUxUQr8kaZtzjjgzkemH8tP8APE
 grw2j7Vnu/Lr6rk8xUVPsOWigdqzcMa9FQ3nI/rImcnD7+L0UFbi/xRW1x0e6AA8R3LZ
 9McAQE0fOAVNA1V/Pv2MF6bQYsPzMXm0uGDGuOPce9zBvgf/0/vnhzwcu44xN1HBCP1Y
 fCZGM9G9nCE+JKqekRRk6cDaUOEx+ZBJxmmKrjoxu4fitQZJ+xxmHoYhknZBm0tYRzVZ
 4CRQ==
X-Gm-Message-State: AOJu0Yz8TF451bOhEsQgAo1l29FdAUVj+OSZ0y55gHNofv5Vq/A0B4E4
 lUkasarm4hg85BaFKvRicGGtFWrWHxOpbr6vTKbBeCiseHCTZSPtXHpoEBz1hY4CrJdOoBzBjdM
 OWgEotRCNF80jKaGjS9sekIxYCQW+oGR2UwUY1WU60Q==
X-Gm-Gg: Acq92OFzAzSNqKjcXNMWIYcgojenLU51DmfJTHhsgKIlYWOc1MJTXoqK9EZmWlQ7UcZ
 6bnXTVyXGRYGqaAqwaYSApG5VUs7l8SPb8iWXWEq+wv8pS26mGdxNNFkg3bYI/2w7wRaAwM6OGE
 st9fQN/059Ju2TZLQQf51L5AwbrcNlwkQT9CsiF5qc9U23Ga7qx27h3FvlxafjmcKRWYKCnxfQm
 QlYteDmnFanmwGUM1LBzWT1YdEesCSvU1GNDGh27bNCs5bvCG3I/zFeAuBhxCcVexS1HRfriIWR
 4kmUkLo7x/INgQfEsOSrzdnsKSl5wBuoy4BIK9k0btDn/pc3/C1HMujRshWjHYMhy4PyfNd4vnv
 kbg==
X-Received: by 2002:a05:690e:1507:b0:65c:477a:2ad7 with SMTP id
 956f58d0204a3-66284faf621mr11453987d50.25.1781599534140; Tue, 16 Jun 2026
 01:45:34 -0700 (PDT)
MIME-Version: 1.0
References: <20260605034729.2874861-1-kylefoxaustin.github@gmail.com>
 <CAFEAcA_=2j+jHuqcCF0S9X=4q3dhY8=EKJuGCkuuUSG1jaO0bQ@mail.gmail.com>
 <CANqqvPeUAHNpw5_h=Lq4ts=W6sE49occngXga+o=Yezem0dr3g@mail.gmail.com>
In-Reply-To: <CANqqvPeUAHNpw5_h=Lq4ts=W6sE49occngXga+o=Yezem0dr3g@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 16 Jun 2026 09:45:21 +0100
X-Gm-Features: AVVi8CdQ61AByWKvvb7CGxL_maMOV9RrSpESmG2SL2JdfW-yU4LdS628497gfu8
Message-ID: <CAFEAcA8Q5=Ya3BhmhvpPGjs69KDH_H+9ZxD3q2fACMhuX-f1BQ@mail.gmail.com>
Subject: Re: [PATCH] target/arm: align down misaligned PMSAv7 MPU region base
 instead of dropping it
To: kylefoxaustin <kylefoxaustin.github@gmail.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b135;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb135.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Sat, 13 Jun 2026 at 06:22, kylefoxaustin
<kylefoxaustin.github@gmail.com> wrote:
>
> Hi Peter,
> yeah sorry for sending this in.   Based on your feedback I went a bit deeper
> and realized what you pointed out: I was chasing a software bug that
> exists in the guest and QEMU shouldn't emulate one particular
> implementation's choice as if it were architectural.
>
> It is based on NXP's proprietary M7 sdk firmware which I can't modify.
> Plan is to clearly document local workaround and see if I can
> later convince NXP to fix it on their end.

Thanks. As this isn't a particularly difficult or weird behaviour
to implement, I'm not 100% opposed to making QEMU do it, but
generally for this kind of thing I would want to see that more
than one piece of guest software was assuming this particular
UNPREDICTABLE case before we change QEMU.

-- PMM

