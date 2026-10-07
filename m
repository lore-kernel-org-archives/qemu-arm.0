Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B11CCA5FF1
	for <qemu-arm@archiver.kernel.org>; Wed,  7 Oct 2026 09:54:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xEOKz-0007Ju-Qu; Wed, 07 Oct 2026 05:53:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1xEOIL-0004E2-67
 for qemu-arm@nongnu.org; Wed, 07 Oct 2026 05:50:43 -0400
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1xEOIJ-0001gE-Lw
 for qemu-arm@nongnu.org; Wed, 07 Oct 2026 05:50:40 -0400
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-8ab8d96d02aso17858257b3.1
 for <qemu-arm@nongnu.org>; Wed, 07 Oct 2026 02:50:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791366638; cv=none;
 d=google.com; s=arc-20260327;
 b=SwIwpHfuphwsPPOTacCW+bCYo1/ytd2vrdYjNHivqxyDgXOW4HD+3OMIAn7+raRw2o
 pGD8irmG6JGIqWNVQWPk+rSFWnsA6akh56wW4rW276UHwPwrJDvOO1VjWU28+TAd7WJL
 zn3TppWCYKX4LOCi2kJjgZi0lYvgrRKZcY/lbjhWsTM8ByqKJG47Js/hMLKuAckZ8Hh2
 aCSjnJILAffgn+I990cO/pOx/kpYC3YMW46niJDA+yZ2XwKAl8rS0+G7FRsVFVyHHRSd
 zKvZ2UyTyZeSxB1w6Rarsfp8kvh9JKEkootESzLosdbNeqzXVFP4HKrzK0KTfbaibBnb
 UfIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=OP8HOU/Jxuc6BI5HRZH3ttlhe6t9yJpzW5VfaWtyPHE=;
 fh=mtgpa4r6k75J3c/oL03mecQepTGONnCD5hXqZBNVBRs=;
 b=Gg+R7RYb/+5dPJ/Zfj3A+73xzR5EH0sYgW5ZlalcM7yb55CTCqhBAkPL/8v5+mp6Pe
 oD5OcD0JAw3a1kXeXjdiLZZJ6O+ZEP56BYYJrt47R5vUEX9PIKdge/JBSgd7RmZtVqCl
 1JnhcEF8UdlR79THlnVN5jc2RuRufCev45qg5jNss3935Xd6kEG01jcEWh1/GIlR3orN
 P0Q/SNiYkAXSD8G/m5REEk3L6uncmpvcPgpjSgggdohAv4XERD1G+opviA0BB9+de2bW
 dZM7PwrsMNGAeG065/w4aGpgFqOzLcltL5Ae1w0Uf0RFGZ/JNZnSn7RmKPn9vfQAELbn
 IR7A==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791366638; x=1791971438; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=OP8HOU/Jxuc6BI5HRZH3ttlhe6t9yJpzW5VfaWtyPHE=;
 b=qde77bDPHLqj40uKbdPbEjOj8F0x8yAdB7NJmJJNtpRce2MfXqn98oozgxHhjqNdjm
 HKGxEIHl30tfQuG0yBoOS65MnUWcGOWMiZH6RupIJ8CQdVqFP/nyrerCUqJTUov2T8IU
 OUManR392UnZ6D2XAP81Hj+8bTnt47V3Qii9SW9u2CEtq2b6ZhmG5v1Sm0ZGkeppur2g
 21MOuVCa5gswPV9JyI7jpjHj5T6PQt7qKc3bopOpTKoWBqDWR5NypfV/9TzHRrlSLANI
 GnEOdPCdg74z4P0w87sNjOPbuP30zEmEJiSgHFGtcz91NhcZMZqHcQhZuWuxouJ305or
 Fddw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791366638; x=1791971438;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=OP8HOU/Jxuc6BI5HRZH3ttlhe6t9yJpzW5VfaWtyPHE=;
 b=16TGXl3QUH8aGtRwtOMbUCWjHZcUc9/9W4DuksPajVsQ4c7ZUIIgj57Qg3gZORBhVe
 HwxLIXzOQB9G9BcvYqznWBq2N88DfaHkP1FlzSyPp6nGZGBYUlwO7DQnBkqR01QfAs7a
 c1YiQHPiWRCDYAHXleis+XhgXocKE/4sNSq8rZy2vEjzcn4erNmwMp31qUMlYOQ4Axjf
 luocmwKqeRzvWJIbSpNEsnluwtQUntiwhiYfGkmaz89JSf/Tgwq35f+d75TZHi4qV/8f
 2tQB462OqrdhiLy+SDSDQFf7BBMEnJQFusbFm60MUF8cYUuAEY1dGIohz0agJ+qBEQgr
 6lyw==
X-Forwarded-Encrypted: i=1;
 AKwUvBxarQkDg1Ue/q3xBiaLT81dtcl4BXTeMqhekkQd94AXC2PRHN8VGALP48R5n8poQrVw7UelPYZcfw==@nongnu.org
X-Gm-Message-State: AFuF++l8XdGQo0DqsE5IH/w5Hccur107EdEc6pthtftOsbe0vpYz2JDJ
 zlR/dEJNGAz3XA4K72K47sjO58YaY31dEFpK2gGOrf8c6FTntaznBfcGDiF1+op0tqt4PpgMHKq
 qlyFxm2rFjRbT8pZyr1Kwg5vkUPlWmKI=
X-Gm-Gg: AYBFou2aObT1B5QXWSidSTqNyMNAtN5Rg3P0O/AfH1p6IW3ht6s92qKHFF0zJVD0jd0
 GslRV1Rwo8lDXgFq7Vw5aOZ0IdYIHzQzZUr7f6wZJvxm/ZDRFD/qvlXf3bfNgUIpxVhTlyqh/mD
 P/63d9qJ/TvphLdRQjHEbijF+Xs2u4KiD+YebdIdnUwj9TIFNpJxjdqcqIWonr0sopUHD6KADXS
 1I5NjQaeBcHCM4qAfQvXrwVuA7RQ0n771IT6TZCNGPG1AX4GMU7PnPUbdXfEcrArIJzVKGtqLru
 +5ykS3mr6Jhur7wdjy/q8sYv2m+yCxJYFpB0b0EvsZMFvJfE+DSMxf3VtpRRkx0SdeaTwnx4I2T
 Hea7WhcHGn2pxgWl7
X-Received: by 2002:a05:690c:4142:b0:8ae:a5b5:e97a with SMTP id
 00721157ae682-8b05ae826e1mr9528207b3.13.1791366638004; Wed, 07 Oct 2026
 02:50:38 -0700 (PDT)
MIME-Version: 1.0
References: <20261006083445.30362-1-shentey@gmail.com>
 <20261006083445.30362-5-shentey@gmail.com>
In-Reply-To: <20261006083445.30362-5-shentey@gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 7 Oct 2026 17:50:27 +0800
X-Gm-Features: AclHuK-pfVeL7Bv97IeM7Mpg2Anw3T7OhhimCeHiHQkadRh967HvhBZfGvHudFg
Message-ID: <CAEUhbmWXkjHFFz5kC6arkRdmPwyREknZC=HgmyBPb1HRcCoCEQ@mail.gmail.com>
Subject: Re: [PATCH v4 04/31] hw/watchdog/wdt_imx2: Remove redundant attributes
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Peter Maydell <peter.maydell@linaro.org>,
 Bin Meng <bin.meng@processmission.com>, 
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Gaurav Sharma <gaurav.sharma_7@nxp.com>, qemu-arm@nongnu.org, 
 Jason Wang <jasowangio@gmail.com>, Alistair Francis <alistair@alistair23.me>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1131;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yw1-x1131.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Wed, Oct 7, 2026 at 5:03=E2=80=AFPM Bernhard Beschow <shentey@gmail.com>=
 wrote:
>
> Since WDT and WDE are write one once bits, their values always
> correspond with their respective locked attributes. Thus, the attributes
> are redundant. Take advantage of this observation to simplify the code.
>
> Note that removing the attributes changes the vmstate structure which
> constitutes a migration break. This is allowed since QEMU does not
> guarantee migration compatibility for i.MX devices between feature
> releases.
>
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>  include/hw/watchdog/wdt_imx2.h |  2 --
>  hw/watchdog/wdt_imx2.c         | 20 ++++----------------
>  2 files changed, 4 insertions(+), 18 deletions(-)
>

Reviewed-by: Bin Meng <bin.meng@processmission.com>

