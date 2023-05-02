Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp2079116ejm;
        Tue, 2 May 2023 03:29:04 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7aWf1F/8+Iwt9Fc/v6SDqmRRHD6qci9+2NfkUWvzekgIRkF0Hjas8JSxag1oMp4HzzBWYP
X-Received: by 2002:a05:622a:1a29:b0:3f0:b56b:f397 with SMTP id f41-20020a05622a1a2900b003f0b56bf397mr27297494qtb.27.1683023343913;
        Tue, 02 May 2023 03:29:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683023343; cv=none;
        d=google.com; s=arc-20160816;
        b=ENpm0KZQEmJaTfPtyGk6YBo5J8RIiVu+niabU8Ab+Tr44oG1jSchOYj8lF/HmMyx2r
         RsYa5faBkRGu3FHVj2xML0sZ4msoHwIOKLtpEikG0eQyqjjKLfO933PFlYuztPmyEKgT
         jB8fW3+Lke7zLmnfccNPHcX0gGHFxSujguC4/j8se1Nm4JYfjN7L/8AIDaAPKGy9JjmS
         B8aKMNQppUo24Qo0sULHnhEnVW6qh4GXmpjJtA8Pq4eJFjDqqCDci6K+3HGNArgxYX2H
         fTaISJ0UmlOu54sLmaq+6kGl69mEKGxJJQ5BWk49Hs9mruK52KpG9ZKoSgqcRlsNy6lz
         ebKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=CFjddmb+gaqnAxWy5AwbZY9dBYy3RIaTgKxcylDUI9k=;
        b=ChlYBnmUA/dORbXPtSzH9mX33B9K49lonU5eOhzmrbc7fJj2fQBJoLzh0Wfdlg+fX5
         ueqCq5o3uOoYwaVBo6Tck9vGB6FhRbs1C2WiY07MnzanEhKb2mEt21Ys9qUQnRYhLRTt
         r60sialo0hh1Xzm68SETrGX6MWkuMZGUyFiVJq6eiW9fwvCN7CSZe2amPnNzWmMw9s/E
         /1ufgc2Zsdq67c6v3lbwF08fDUm7EPEKTByy0eA+dW2+pf8xmWhvNGDve5c6hEbJAy4U
         erDqqeCOrddGm6a2KHbEiczWIvREJTPyVSAdxLeHxtH0QL6q+Vv6mAq0Jw78T4ry0BW7
         j3og==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=L24OCmZz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t14-20020a05622a01ce00b003e35ac8c1a7si17631726qtw.95.2023.05.02.03.29.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 May 2023 03:29:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=L24OCmZz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ptnFY-0003c2-Aw; Tue, 02 May 2023 06:28:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ptnFW-0003TV-EV
 for qemu-arm@nongnu.org; Tue, 02 May 2023 06:28:46 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ptnFU-0007op-Ut
 for qemu-arm@nongnu.org; Tue, 02 May 2023 06:28:46 -0400
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-50bc4b88998so4223318a12.3
 for <qemu-arm@nongnu.org>; Tue, 02 May 2023 03:28:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683023323; x=1685615323;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=CFjddmb+gaqnAxWy5AwbZY9dBYy3RIaTgKxcylDUI9k=;
 b=L24OCmZzWlfQ4KCTU4UDYMoTbEDgFLeIghhuzCxqNn/YTeb+quuzaMozdXLU8GR87b
 AXLGpQ+pxYah64vTSJP0ZQRth+XpvM2NJ/Noj0X1SwtH0mwpCivHZO9IuibZPft1Yuks
 z1CV3wV3sBi9rDsbPjow7u7htkAYF18LkvrfLJ9PmcrWVe4Zu40IFl64QG5YGHSe3Ude
 jyPfTDvGXYYE7IUbAlUm1y/b5C9kFqzYbawqo+BhG17FugfkCZDWdwR9Hqz80myyWdoM
 G3TdCCxgAPTji8htUhHwQrDohiilvr63P5s3ARVOzoWd+3pqbVX0CEnVd/mE++WssS9W
 d4Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683023323; x=1685615323;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CFjddmb+gaqnAxWy5AwbZY9dBYy3RIaTgKxcylDUI9k=;
 b=GYfUObl2qnnrVfaj1SdMOC0Yj7p13KbNPfpdq/63pqMeoLFZ91kt1I+uGlJ5AsVQrZ
 7jioLJgqDiUBhFojc60pKD17JwlFjSMEZGmf/YrFeWN0w90o8BFRTHtr7mvJzumiKV5N
 Kj/qI6T46BcC/pArLIdmMgaqTxkooVUdS7G7zoUpzvTOYN0bsvcR87WtyOPevi9ekuBY
 2JIsmEBwDlvM9hvF2p+Hji6COEv/ulzyhcxc7mnAPnpFDvUIn39VdBgCo6xHRaxTxoHh
 FSJjDiY/WfsXjy80zuqtmRDQJNKG0TiMnkZkvUMdaijVI3DSaOgGCUESop1PYKxACOD4
 23sQ==
X-Gm-Message-State: AC+VfDwuc7BLBTaSwHUUztbFO7+dJP6q7AuSp+hniNX0NvJsAMfX4xNt
 ZY50c1b1shyBUnOfV0Qq/4U+wTxZqlJU7s00bp6CfT/VCtGkEgLP
X-Received: by 2002:a05:6402:513:b0:50b:c2b6:90eb with SMTP id
 m19-20020a056402051300b0050bc2b690ebmr5857900edv.12.1683023323498; Tue, 02
 May 2023 03:28:43 -0700 (PDT)
MIME-Version: 1.0
References: <20230424152833.1334136-1-peter.maydell@linaro.org>
In-Reply-To: <20230424152833.1334136-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 2 May 2023 11:28:32 +0100
Message-ID: <CAFEAcA83W9CjNZ_6xBMTWbHGhTJNRo7RQ0+4uCnY1owMxc37jw@mail.gmail.com>
Subject: Re: [PATCH] hw/intc/allwinner-a10-pic: Don't use set_bit()/clear_bit()
To: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org, Beniamino Galvani <b.galvani@gmail.com>, 
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52e.google.com
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
X-TUID: oc8NH7MC9oPq

On Mon, 24 Apr 2023 at 16:28, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> The Allwinner PIC model uses set_bit() and clear_bit() to update the
> values in its irq_pending[] array when an interrupt arrives.  However
> it is using these functions wrongly: they work on an array of type
> 'long', and it is passing an array of type 'uint32_t'.  Because the
> code manually figures out the right array element, this works on
> little-endian hosts and on 32-bit big-endian hosts, where bits 0..31
> in a 'long' are in the same place as they are in a 'uint32_t'.
> However it breaks on 64-bit big-endian hosts.
>
> Remove the use of set_bit() and clear_bit() in favour of using
> deposit32() on the array element.  This fixes a bug where on
> big-endian 64-bit hosts the guest kernel would hang early on in
> bootup.
>
> Cc: qemu-stable@nongnu.org
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>



Applied to target-arm.next, thanks.

-- PMM
