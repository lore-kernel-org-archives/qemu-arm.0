Received: by 2002:a17:906:b10c:b0:992:abd5:50eb with SMTP id u12csp1583711ejy;
        Sat, 1 Jul 2023 18:35:57 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4AZz0/DxTR3kmapOB2/Lfn6aJ6D/T1BzjC8NPcPSdyP037WHnRbVIXxp+6bjcH9EmBHN7O
X-Received: by 2002:ac8:7f81:0:b0:3f9:c539:c9d5 with SMTP id z1-20020ac87f81000000b003f9c539c9d5mr7283762qtj.68.1688261757651;
        Sat, 01 Jul 2023 18:35:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1688261757; cv=none;
        d=google.com; s=arc-20160816;
        b=XNypsoew/Tg9G5lMbjxlZIb3zkyTrAlO1GppLnSWiYe3nxqhJM52jOGkXFd4wvby7R
         YudSCYaETBHwnircOpMytlWdzp/EJGFppKbLY3B7HRN4JtHrzM6eqizbOxqTbrtqpdd4
         CcqexiPkMPt7yHmbYBE0jD98ZqWxzY2NGoxANcVaPXRI6HTO4oISV55mZcMLOrMK5+BW
         baDVKa0Igy/LY+6icc3QqCy6lxm/X7/F8Jyei6it9J7uEukv8r2KzhgmxhVV1QnHQAhk
         RwmIjmbqCOwlfi672/cPkWORPYw3eTZftwzpos0ayfiQ+ayLrmgHb4sn1asEfBkolR6h
         Kf+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=5j0ylvlbGyI2o543n1+Hlev2yR/lbdvBfoJ89tLrDBU=;
        fh=zo7Wz1o1/TZeCsPuYvWsqmU2x9Jm9pIDnDO12F7ESBw=;
        b=KQLrPFAPibyKu5chSAMVvrTOLm55pCrd4+lfSztvkzlbQIfJhtVCzXsmI+cCH9AUg7
         DccObole+AaFLnwlYFRxx+gT7KP+tpdRYXSBRMqTPOLjmj/CeNnZhjz2Bjfr/i9GJdnA
         oxUFA5HIjfsnwirjjoSVGd1KaqH66t7/yCzAk6Meq0TJ1bgPhX1hRunw1nkVi8mFELwY
         97lKP4bS7zQuigAwaG+2ALZRJv3xIa8mD6Vfvf5aodn5slrbZVV/SOdtMI1B+KMj9qhW
         JYrXk1Ws2oL9KKNokoxhnwzLFK8FikGIQO7YAZd+rG9COt/GYiqPh//lCE0d/Ztp2vaO
         QtsA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20221208 header.b=kUlmuVb2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v5-20020a05622a014500b004034d531656si1475529qtw.437.2023.07.01.18.35.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 01 Jul 2023 18:35:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20221208 header.b=kUlmuVb2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qFm0A-0001K9-JU; Sat, 01 Jul 2023 21:35:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1qFm08-0001Hv-2j; Sat, 01 Jul 2023 21:35:44 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1qFm05-0007fY-Gc; Sat, 01 Jul 2023 21:35:43 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-3fbc244d307so32768425e9.1; 
 Sat, 01 Jul 2023 18:35:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1688261732; x=1690853732;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5j0ylvlbGyI2o543n1+Hlev2yR/lbdvBfoJ89tLrDBU=;
 b=kUlmuVb298DiS/8NqG1XMgkdQY+KnESkwbVtFR6RaOyeAXaCGiIMsVJfHc6ipDPeoF
 CykiaxFV52/HM1oLtW/ESvQYl5XjcfK0c2O+j+Poq403vsILbcM8CyPuBjsmMfbfYQNz
 ZW1e0wGMB7/knGs8SjKYw8Ri7iNh5dMxarlGhbJRHTv7tF+DNKg5pAX3bWYpuY8Mo8AR
 WEsEsr6R0r25w0rOuwAIIgH9Znq8gxnShOd1UjSrrTQtFGvTD+GRZLC9+TmXvoa+38ZD
 AIKZiVzX3EuK7tZvmXPWyrL9G1CR3z7cxrCzsBlVdAVxu2DKJ4NfF50WnkJ98zh1B0sO
 ca6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688261732; x=1690853732;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5j0ylvlbGyI2o543n1+Hlev2yR/lbdvBfoJ89tLrDBU=;
 b=YYHlU1dD7b4QHrY5iKJh+EumEczgNpnGHZ6plJFK1lxP6vNXf8bHaQw07dnZwtj/Ea
 80MjIWxhg1mkEPzf6qPiyPD/yPMH3+fGEOUuuoBBYV3JNLvT+ADBDsG0+fhB6lLSRkhz
 OwuIUan2dCBMlZpgRQ32wyN2ZxXJzwVWoAf3XBZaS3XDJa2G3d4H6O9K/td32rLMh4Jc
 Cp1VyC/37br6fx5S/pImWdfBgPdhVUdu+/C7YWzcfKsf4Zno9EXc3peP8qnDYsX7vkfe
 StxnQt+FRVVbqUbEstsySmJq2lRB9NULSKerr4tTnrrB2wycipn40LaSJUx0+SthMQ/y
 WSig==
X-Gm-Message-State: AC+VfDzQSHL+L8hx4+DdFhZLSUOY58PW7LiKR0FV47XRoo3GRgniWAKw
 YjT95OoylVdNjyDWeux1bUnvWwbtVtvz+DlF+JA=
X-Received: by 2002:a05:600c:b54:b0:3f9:846:d892 with SMTP id
 k20-20020a05600c0b5400b003f90846d892mr5564867wmr.9.1688261731941; Sat, 01 Jul
 2023 18:35:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230625015321.77987-1-bmeng@tinylab.org>
In-Reply-To: <20230625015321.77987-1-bmeng@tinylab.org>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Sun, 2 Jul 2023 09:35:19 +0800
Message-ID: <CAEUhbmXVL8YLEDgPhj9zxhAt70nMF5=TXn491-tCOxoHaF=+QA@mail.gmail.com>
Subject: Re: [PATCH v7 0/9] net: Pad short frames for network backends
To: Bin Meng <bmeng@tinylab.org>
Cc: Jason Wang <jasowang@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>, 
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org, 
 Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Dmitry Fleytman <dmitry.fleytman@gmail.com>, Helge Deller <deller@gmx.de>,
 Joel Stanley <joel@jms.id.au>, 
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=bmeng.cn@gmail.com; helo=mail-wm1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-TUID: FuxpQbevDBDU

On Sun, Jun 25, 2023 at 9:59=E2=80=AFAM Bin Meng <bmeng@tinylab.org> wrote:
>
> The minimum Ethernet frame length is 60 bytes. For short frames with
> smaller length like ARP packets (only 42 bytes), on a real world NIC
> it can choose either padding its length to the minimum required 60
> bytes, or sending it out directly to the wire. Such behavior can be
> hardcoded or controled by a register bit. Similarly on the receive
> path, NICs can choose either dropping such short frames directly or
> handing them over to software to handle.
>
> On the other hand, for the network backends like SLiRP/TAP, they
> don't expose a way to control the short frame behavior. As of today
> they just send/receive data from/to the other end connected to them,
> which means any sized packet is acceptable. So they can send and
> receive short frames without any problem. It is observed that ARP
> packets sent from SLiRP/TAP are 42 bytes, and SLiRP/TAP just send
> these ARP packets to the other end which might be a NIC model that
> does not allow short frames to pass through.
>
> To provide better compatibility, for packets sent from QEMU network
> backends like SLiRP/TAP, we change to pad short frames before sending
> it out to the other end, if the other end does not forbid it via the
> nc->do_not_pad flag. This ensures a backend as an Ethernet sender
> does not violate the spec. But with this change, the behavior of
> dropping short frames from SLiRP/TAP interfaces in the NIC model
> cannot be emulated because it always receives a packet that is spec
> complaint. The capability of sending short frames from NIC models is
> still supported and short frames can still pass through SLiRP/TAP.
>
> This series should be able to fix the issue as reported with some
> NIC models before, that ARP requests get dropped, preventing the
> guest from becoming visible on the network. It was workarounded in
> these NIC models on the receive path, that when a short frame is
> received, it is padded up to 60 bytes.
>
> Only the first 4 patches of the v5 series [1] were applied in QEMU 6.0,
> and the reset was said to be queued for 6.1 but for some reason they
> never landed in QEMU mainline.
>
> Hopefully this series will make it for QEMU 8.1.
>
> [1] https://lore.kernel.org/qemu-devel/859cd26a-feb2-ed62-98d5-764841a468=
cf@redhat.com/
>
> Changes in v7:
> - new patch: "hw/net: ftgmac100: Drop the small packet check in the recei=
ve path"
>

Ping?
