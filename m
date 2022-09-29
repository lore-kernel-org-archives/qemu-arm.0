Received: by 2002:a8a:1193:0:0:0:0:0 with SMTP id m19csp702356ocs;
        Wed, 28 Sep 2022 19:10:16 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7btRiqrLi4A0vhEw3KhVQ/OpiBlnkuQdX41/3bBJeVD9XtuPCD2s7jAHf4d4bhQEFG4FI6
X-Received: by 2002:ac8:5a13:0:b0:35c:e9b0:430b with SMTP id n19-20020ac85a13000000b0035ce9b0430bmr648457qta.472.1664417416151;
        Wed, 28 Sep 2022 19:10:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1664417416; cv=none;
        d=google.com; s=arc-20160816;
        b=hbBz3zADiwYgAdGocMbf85IhppG9qyxFU8OuiUDSeaj0WilQNDL/r2lRUHQBUnuiMX
         jg/0nhacvHDVsMlhBz4IRf2Qe6VZ+wf2oQQUqgzfnToRjO7SaDEeizBkfMctZQ8rz4WK
         qiXAvVup9YQEv9+z25d+xB0OHRshYjaAqpHyD4ABi4VsF9IUHubVA7SwPqP2xzKFkwJ0
         mn9JiHEXS2GevOFsO2DP7x+YJfc2L53x0sO9f3Ezxy4L1SgU/JL6XQsFPBVPUtZFADHe
         n3BIHwIVTXjwfmlVMow2gjUSkuCfGbCrCjF3YBclnTPOje0omAwtfX4x+45F0Dp7F9Y/
         CvRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=B1pfu69ui5Tj2U6pHvBeXeW/vQQ4GR/AM72AWuyVQyg=;
        b=g3ZekuExMI/jvvuetw1u3AWrShWHz083vvQkIL0uiMhkcJgl+0X2MfEFAph6/YlhB9
         ti+Kom6+ZOM8Z+SLJvh7KajU8D7UbY8Yl8Gk2JMCbg9z9GontQotQZtqyw9YxIeDm4PS
         Vtf3eJlwprrtJt0BqKFY6UQ4bVytE524Oo3Y7q8q9XVpnjJZenzqqU70xv5UftZn1Zx8
         so/npDmPmK+tmsx2hl6lMFn10MTNez7WyNGj9Q1/WI52rjYZ7FiAt8nBhd8xliFfCDOq
         5oiJJbmUzTt7lMBqeWRxqENZl91rFWu4Nb1j/pgOsZWCap5tY91I16MlgQuNywVryh//
         B5/A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@jms.id.au header.s=google header.b=Ithgil0u;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a79-20020ae9e852000000b006b98ff83cd2si453202qkg.718.2022.09.28.19.10.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 28 Sep 2022 19:10:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@jms.id.au header.s=google header.b=Ithgil0u;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:38560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1odj0B-00059U-Nb
	for alex.bennee@linaro.org; Wed, 28 Sep 2022 22:10:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1odizt-00059H-Bk; Wed, 28 Sep 2022 22:09:57 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:44892)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1odizq-0007vb-Ph; Wed, 28 Sep 2022 22:09:57 -0400
Received: by mail-wr1-x42b.google.com with SMTP id c11so22322342wrp.11;
 Wed, 28 Sep 2022 19:09:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=B1pfu69ui5Tj2U6pHvBeXeW/vQQ4GR/AM72AWuyVQyg=;
 b=Ithgil0u7cUMiHyDeoetTt2vgB+o8UCpoVE29np7r8xlhh1+0OQxqGUM081CK/wuCS
 WbUl0+5vVHPWF+ca/xRyGu2NvAT4UoC3UGvB9l+HGeWIJ1zKQIxY1Wiv1tk6RzadGfIV
 4lNjkdGZrx6tb35vmi9l3XhFjGLYgRmhLyBpI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=B1pfu69ui5Tj2U6pHvBeXeW/vQQ4GR/AM72AWuyVQyg=;
 b=u4iGOLtARbizb421tswAMERyWUew67aeK6K4VAurr7ehAQ5oa/bzA/yoB38Bd9qlgY
 cNNkg4NcuX+WNjneiTm7k4zg/qArhmrqdj/2MpQLvQ9c3UOSZbusShLqLsHIMNQMF6eu
 0/fa4/gYCz0FOxs7WHsXNG2n0pgpD+3O5dl8c78fFB+NwjUwjN4y/EcJUiaLYoQSywlW
 ++ul9L7hgJbDItGjce+MkQ8s/Y4xJ2cIM96hsIk7HA4Ip7dsXVsI4xHRNZ2dAFIeTXDy
 EwGZ17H3wviRT463tW33TRNfdB4sx/Vm1WlhoJCe7ehI1oHC2s+HCAFiYgP7DjyVkzSf
 ewgw==
X-Gm-Message-State: ACrzQf0PWoKxpDnzVBLiatzqUVLIVF5XDnZjnYG5KPuly1GNsE77HZIC
 ZT6d+dtf94Co/z668X13TDxcLo/PPUVBe2a4RTA=
X-Received: by 2002:a5d:52c9:0:b0:22c:c9e0:8547 with SMTP id
 r9-20020a5d52c9000000b0022cc9e08547mr424720wrv.3.1664417392191; Wed, 28 Sep
 2022 19:09:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220928164719.655586-1-clg@kaod.org>
 <20220928164719.655586-3-clg@kaod.org>
In-Reply-To: <20220928164719.655586-3-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 29 Sep 2022 02:09:39 +0000
Message-ID: <CACPK8XckTGxZ6H=0kMkaS7yfxJG2gkPVtRrZYCGBJH=3ZyLxiA@mail.gmail.com>
Subject: Re: [PATCH 2/2] ast2600: Drop NEON from the CPU features
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Andrew Jeffery <andrew@aj.id.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=joel.stan@gmail.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-TUID: mEQwU37SUNjs

On Wed, 28 Sept 2022 at 16:47, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> Currently, the CPU features exposed to the AST2600 QEMU machines are :
>
>   half thumb fastmult vfp edsp neon vfpv3 tls vfpv4 idiva idivt
>   vfpd32 lpae evtstrm
>
> But, the features of the Cortex A7 CPU on the Aspeed AST2600 A3 SoC
> are :
>
>   half thumb fastmult vfp edsp vfpv3 vfpv3d16 tls vfpv4 idiva idivt
>   lpae evtstrm
>
> Drop NEON support in the Aspeed AST2600 SoC.
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Joel Stanley <joel@jms.id.au>
