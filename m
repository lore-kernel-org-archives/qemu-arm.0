Received: by 2002:ac9:4144:0:0:0:0:0 with SMTP id u4csp349179ocg;
        Fri, 7 Oct 2022 03:28:06 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6Yah2RhV131Lt97rLbPdozfkEo8avwB3T5nnw1FKM9lNJnbkyJsAsjlFmrQk2IF9NIcU1D
X-Received: by 2002:a05:6214:d85:b0:4b1:8e37:902d with SMTP id e5-20020a0562140d8500b004b18e37902dmr3355659qve.120.1665138486011;
        Fri, 07 Oct 2022 03:28:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1665138486; cv=none;
        d=google.com; s=arc-20160816;
        b=Yw/nV4nnDptR2Fsu1Xpnpx6g8OptptU/2uIt/pgcjsvHi+5dSIOv4anY5uP+6/Va9i
         N/WE6Jez4kQXkLpI/zRJg64eeEGhKw1gKVd+94hq7FhjPLEE8NuYkLLPiEfsAnTwz5BK
         tfbvik8MTUuZPcOjkgzMWkzirB/U0hIE5DAd+xQM4RclHwVm2mCL+AlQKTN9m2rwVrkS
         MdduPi9pNUEJFnNm4l7+DXN/FD+GjC0+2XYpiz2p+fK7edPb/WLXajbgw7cKJb45hyZP
         UGGTOxlQ113FLeCG6w/f6qNbwEoeHXbnpgGnq48pXE2AQ5fB0M7x9ZjgFoB7Yh4TdVdh
         /9RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=hy9VANTnzlQtEi2usuKEtShhb7fB7keMadfp3zH8ABE=;
        b=oQ8Q86F+fRYPkB0RTF+eMf9nVSONUImC+PfoxisRoHDljN/3vjBGisf6U/lsxz04x/
         PnZFrPBqv97CCzsgAtwfRz4Q/kQuTDMhOR4c/C0eFBoqjw8SXFEGc3buivnowrVNizoH
         uEabGa799moOx6WqSYob2Q1jc4uI/j0muEUI0NtBFvHycLUr7XBDcx1MCTiqWjM6ZzlH
         EN02MoZBYfzPKh9iodvsX+cX9Zyy+P6hiP+cPPsCa2JzFkTcIGfa0GXV+Y1/lXb9rt3y
         UmzaVRk7eIYq0eJTqzbxIFXBrv13iK7CO+68dxR3z/OKUkTKaiTHTU1qhLxJxtRkswIy
         csnQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MeU76rRl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id az20-20020a05620a171400b006ce1a085de1si689303qkb.571.2022.10.07.03.28.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 07 Oct 2022 03:28:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MeU76rRl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ogkaL-0000iD-66
	for alex.bennee@linaro.org; Fri, 07 Oct 2022 06:28:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ogkYf-0000ck-0L
 for qemu-arm@nongnu.org; Fri, 07 Oct 2022 06:26:23 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:33589)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ogkYd-0008Qk-JJ
 for qemu-arm@nongnu.org; Fri, 07 Oct 2022 06:26:20 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 n18-20020a17090ade9200b0020b0012097cso3593526pjv.0
 for <qemu-arm@nongnu.org>; Fri, 07 Oct 2022 03:26:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=hy9VANTnzlQtEi2usuKEtShhb7fB7keMadfp3zH8ABE=;
 b=MeU76rRlAtN6I4/JV3NNg74odu9GCVMSfJa/eDxOwdiDD/986eRlBCk1JiE738zSb6
 wUVY7UNycOTva0yBMsAMtD58NMo/SIlCIWbYFusSaDyT0Sx9+hqDGPRZ/8HNk4uyueAW
 MVDdJcAAJ2Qj6tgNyjujCCfxORRw7UNha3o1c5pnknPR/EGYjRkGOz2wCB7kYolLNGfm
 n94ivHqYLs0OjwBGqNkiKhUN2DjOy0apST6ViXVBLsjtZ/D7P/rBDeLfqypUfSYyYRpc
 1IC7Y770FrfXlvedytN1NdIdeF2owbUKnevv9nwFkltps1NpWaLqFEZ6YTE/3qFUji9e
 dIhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hy9VANTnzlQtEi2usuKEtShhb7fB7keMadfp3zH8ABE=;
 b=arsAg0Fl5x1giCBIBl8IDuIY/H+jckBwNB3WTfRvL+9zC3Ecgs7DFx8QT0n4V3neQW
 jec5Rx1JxgJVazV+Tu7aYX2r2tGYdVglPtFy9Lux72+XSRwrdFQ5oFa3OVt5SqweI2TU
 Kt3Zwu4e17rGRQ3E5caaIM0dh/AV2Jhk0Wc6vnjxBmxUt+VCFT8ZGwKJCKaJea5QJlUj
 v6wKZFjokqvkR4Yl/eqfWODzd3yZ92EQDtv9QHnH0aZzX+DML89Q50uBlOOLEkbvBe+G
 YB67KFHdegi2IgSqiQhE4j6WrpjMmGHE5jBI5vAwWDWv6BkDQxFZ1kr1XmlYQ6o8xAvT
 Ws/Q==
X-Gm-Message-State: ACrzQf1NuH0XjTJIawfZG13OE4rIT6A2IjhA8O86tLgWGsSL7iJbPDl7
 oPTbvVq7X7AWnOUhS1zlPW3fwSpqCMj14cKlsGduug==
X-Received: by 2002:a17:902:aa8b:b0:178:8f1d:6936 with SMTP id
 d11-20020a170902aa8b00b001788f1d6936mr4407388plr.168.1665138378154; Fri, 07
 Oct 2022 03:26:18 -0700 (PDT)
MIME-Version: 1.0
References: <20221001162318.153420-1-richard.henderson@linaro.org>
 <20221001162318.153420-39-richard.henderson@linaro.org>
In-Reply-To: <20221001162318.153420-39-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 7 Oct 2022 11:26:06 +0100
Message-ID: <CAFEAcA-JmWHYZ_0WQY2xitg0s2uPYN_u+ZTOwvmduC+GkFfq8w@mail.gmail.com>
Subject: Re: [PATCH v3 38/42] target/arm: Fix fault reporting in
 get_phys_addr_lpae
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IPUQTLNcfQx+

On Sat, 1 Oct 2022 at 17:48, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Always overriding fi->type was incorrect, as we would not properly
> propagate the fault type from S1_ptw_translate, or arm_ldq_ptw.
> Simplify things by providing a new label for a translation fault.
> For other faults, store into fi directly.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/ptw.c | 31 +++++++++++++------------------
>  1 file changed, 13 insertions(+), 18 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
