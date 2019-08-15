Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp1956233wrs;
        Thu, 15 Aug 2019 04:57:03 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxxJXPmxSKj0Ewc2a/6OSZbvNm1LIQQP/bR7YFh5lBdHEW1r7t7CPRsQPiuc+fPIIvvFIjc
X-Received: by 2002:a17:906:31c9:: with SMTP id f9mr4117469ejf.168.1565870223612;
        Thu, 15 Aug 2019 04:57:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565870223; cv=none;
        d=google.com; s=arc-20160816;
        b=WivuVSJvLarPPPPWjkZm29bzoWgOOouJUynphDZyTebyBVqfLcaFBO5Eq6OjMIrjBE
         5SKroU+rE96fm91RW9M3DgZqbSBMRM4UEHPn8OVMSIjm0rJt6otJ1brtgYwib7G44EtW
         36gcEA5OdhXYZBaQsR4pV0OpUPUIA6/lEaR9eeit/Q+FnGfjN2IWX3t1WKXliDltbOoK
         sMW/gGOMcLwtd50mKtvk4ur6thgLNw+UJIFd3aO+IaMr93RiigSyPKSU3A+xarEwIuQW
         IozPCYp3QjGxenalKb+gBzD86/CnIW+0zhmYn2kCoS4r8VkoYE9fg+Y3eySCIZNtDt9u
         2njA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:from:to
         :content-transfer-encoding:mime-version:references:in-reply-to
         :user-agent:date:dkim-signature;
        bh=J6Tl5qEzr4pz5FhhA8LUi0f7TGWDfUA4Or4PSk6e47c=;
        b=iAO/IJroVwk/mT3hKz7tbhE6HyiGo4Uc8zlmAZkNgmt4h0aTH6Qb0p5Sn49V7EeSkh
         qltEY2VMnHVWJiRrwWkSeXPKIwONl15wVe6Rr1USw2HYURLUC4tvTvMorCLaX2XySCmI
         UPzyZL4MBGcWQUO3gAxrkyaNa1Q/peL1VZVlAESixI1o6HqzYvbaS412VHDQ+y6+t1TR
         bA0VwWVMng9X8A0eMyMT3r+csfCIk5ED7PG/i/Ak1hSc688Be8Nl6zB7vgL3g3nc6JhB
         p2okFCgTEw4mrAcBc5BCICGVfXH9ewx5FeFh3jEBoDQMG4UkvAASuv+0Z8hpRBEfvwFu
         P7Fg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=LZloRwVh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id fk23si1322957ejb.138.2019.08.15.04.57.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 15 Aug 2019 04:57:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=LZloRwVh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hyENK-0005jv-LN
	for alex.bennee@linaro.org; Thu, 15 Aug 2019 07:57:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35050)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1hyENC-0005fI-Fh
 for qemu-arm@nongnu.org; Thu, 15 Aug 2019 07:56:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hyENB-0000sF-4K
 for qemu-arm@nongnu.org; Thu, 15 Aug 2019 07:56:54 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:37493)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hyENA-0000r0-Sv
 for qemu-arm@nongnu.org; Thu, 15 Aug 2019 07:56:53 -0400
Received: by mail-wr1-x444.google.com with SMTP id z11so2001753wrt.4
 for <qemu-arm@nongnu.org>; Thu, 15 Aug 2019 04:56:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:user-agent:in-reply-to:references:mime-version
 :content-transfer-encoding:subject:to:cc:from:message-id;
 bh=J6Tl5qEzr4pz5FhhA8LUi0f7TGWDfUA4Or4PSk6e47c=;
 b=LZloRwVhKJ/PEgwn3v6U44mZxCj3RSYWPKnQzJkt5PjHsvN3tznaaG22MfZ97yCzSQ
 icKUYx1yQgmCvULEkUkw7Q9nOkpLhYUgJy7i65G+LuHT1J7ipL/XS09LrHK8mr3q+SXu
 0Pn+SXFH8hHO37/Ae6a0Y+dY0bZuSz9reUbtaekVqwDx/dsBTxS/6sUWDwiQhDwLSvmt
 GWb49QxxCTrPvD8Osz5kzj6cZVLY3i6zFPSlHPJFxRlDqi47yfiz94H2XWUiHkkNkZve
 KToVAMjtdtbdMf+8WXkyTCEvVBzLY4s4YgR1sAfibuNQtttNdf9Zzm/gFYbjISc7oPcx
 /5Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:user-agent:in-reply-to:references
 :mime-version:content-transfer-encoding:subject:to:cc:from
 :message-id;
 bh=J6Tl5qEzr4pz5FhhA8LUi0f7TGWDfUA4Or4PSk6e47c=;
 b=eVfpEE8TJLls15+MquC4hd3mlwxDIyrMPs5v87sGds0P+6wYQO+bAniNoqKMqOU6CI
 2VN9PP2FswBHJOOlVDZ/yt1HBgZo0gv35juRS81+DcJrT4Vwi0lRZ9hS7e51wyz7mnHZ
 ZA5DBHZ3qOmZyLTqAeNBVvV9mQjizu+yqmrpPejlaSFTb008DxgpXKi10dIMZdQSEXcb
 mavtizXwXiz5VRv9aSJkSN8ASP8MY75cojUMq9VQqzr340bqYY9jPxytcQDpF7LOz57+
 1c1OCPFqQA6rUyclRzsP0gBemdpSS29WKep283ohfPvNfdjmUD5sz6vmg3MVUGPtUsMs
 SZtg==
X-Gm-Message-State: APjAAAXllu7bC5PUESwxHSQLv5UUN90v/kUiVrjt6ZUl6tU3ps9QW6F4
 vR4Z0MV8YFRAO0Lczzn3JMCavw==
X-Received: by 2002:a05:6000:152:: with SMTP id
 r18mr5352965wrx.41.1565870211465; 
 Thu, 15 Aug 2019 04:56:51 -0700 (PDT)
Received: from [10.254.112.49] ([94.119.64.7])
 by smtp.gmail.com with ESMTPSA id q18sm3462926wrw.36.2019.08.15.04.56.50
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 15 Aug 2019 04:56:50 -0700 (PDT)
Date: Thu, 15 Aug 2019 12:56:45 +0100
User-Agent: K-9 Mail for Android
In-Reply-To: <CAFEAcA8exvd3khkNhw2JnJWHdkFH5O=ut7LvN9Tz5H0ZTg95Sw@mail.gmail.com>
References: <20190808202616.13782-1-richard.henderson@linaro.org>
 <20190808202616.13782-8-richard.henderson@linaro.org>
 <CAFEAcA8exvd3khkNhw2JnJWHdkFH5O=ut7LvN9Tz5H0ZTg95Sw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
To: Peter Maydell <peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0F6CB102-2C02-4A7B-84FF-52CC3E6593FE@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::444
Subject: Re: [Qemu-arm] [PATCH 7/7] target/arm: Use tcg_gen_extrh_i64_i32 to
 extract the high word
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ks6r5oEqjW3Z




>
>This patch is fine, but I noticed while reviewing it that tcg/README
>labels both the extrl_i64_i32 and extrh_i64_i32 operations as
>"for 64-bit hosts only"=2E Presumably that's a documentation error,
>since we're not guarding the existing uses of the extrl_i64_i32
>here with any kind of ifdeffery to restrict them to 64-bit hosts ?
>


A documentation unclarity in that the opcodes are for 64-bit hosts=2E The =
tcg_gen_* functions are always available, and expand to INDEX_op_mov_i32 on=
 32-bit hosts=2E


r~
