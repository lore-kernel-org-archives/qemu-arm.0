Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp5836437wrs;
        Tue, 27 Aug 2019 15:29:19 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxeA4MrTRIaPIJNHjeqM6gh+zDYXYmFtyMW39sksbTm8WY5oanTOORRiEgJ8yCLncjtSDJA
X-Received: by 2002:aed:2e07:: with SMTP id j7mr1222884qtd.379.1566944959695;
        Tue, 27 Aug 2019 15:29:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566944959; cv=none;
        d=google.com; s=arc-20160816;
        b=sR6rD4XfwZo0aaKvFjEAn5H7VJlM8us+F4iLr67U60EOQUPvjALjKWcQKr3G3hEkRO
         /BAHTmTp2atT2NFDW0MWCKB2PDYKz9KZyfpWfS1X/e1eaEWMoa4RM4M9eM+ZNPNQk2p1
         lAmPfodJtZ2eIo7mzgtukv04kcOGAvQipmtI7pcPXmMgbthgUorjjEkBxSyjxHPPa0PN
         07lPprCWRqNami5/gn0JByMISAXuQlc5lHVApxJNCDv8seWeusiMs5jn/FVbXZWOh07a
         N46jy86gXojval9RceQCmkuVg2fHBn28VCcJ8hXy3RzhgORwVO2qqHgUSycLrZxP/Wsa
         pAIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:references:to:from
         :dkim-signature;
        bh=IF9fJL+VeAQcEJG2C6t3bkzt138oQ5+LBv8tEkVKhEg=;
        b=JXwqKPmOdamBIHjyhhT2fC3Wyzt66FR3NDbldsXOkhbVoqijlgLvbTJQuu7VZ+61OT
         OYm8jmOED83D5ZHmQszCArybOJ7gYfk4hzwA4DV3VkJ8LdSBt5+VHEhFGczmHdLOmP0n
         I6ycG/8oRPo0OOB7vNE+JyWQQG8uFxO9oc3LIqR2Z+d/WzW6GFX4vOIQaPm5tvpt9/zF
         zHc8WPdyZmT4qVZUidJ+uWeu/fO8rKkToeqJp4knSvWFP7dp8eBqaMULyKB3nO68GNFn
         nfCWO0moQO3m1Tg68bP39hO2fTIEbAomfIBkMNHEmMwMrKrwstMd41sSbJelFAdlkn5e
         qbEw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="BYENM0/d";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u40si429258qvh.217.2019.08.27.15.29.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 27 Aug 2019 15:29:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="BYENM0/d";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i2jxn-0000cU-6G
	for alex.bennee@linaro.org; Tue, 27 Aug 2019 18:29:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43145)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1i2jxd-0000bu-O7
 for qemu-arm@nongnu.org; Tue, 27 Aug 2019 18:29:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1i2jxc-00071G-K5
 for qemu-arm@nongnu.org; Tue, 27 Aug 2019 18:29:09 -0400
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:43373)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1i2jxc-00070x-Aj
 for qemu-arm@nongnu.org; Tue, 27 Aug 2019 18:29:08 -0400
Received: by mail-pf1-x444.google.com with SMTP id v12so295666pfn.10
 for <qemu-arm@nongnu.org>; Tue, 27 Aug 2019 15:29:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:from:to:cc:references:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=IF9fJL+VeAQcEJG2C6t3bkzt138oQ5+LBv8tEkVKhEg=;
 b=BYENM0/dJhnEo3c0Bn4KsfpDPgGdNc4wZXr3+PQGxSNThfVU07uAAXQvtjVEZHdlCU
 O79Qtj+xMx20VNCFipXK09dlVY4gEjyMOBsJuxi5cOv1HqVsz1ei1izIfSj430kUr3Cr
 AzbF6daKxI3OJXPNGPad2iuqk6+N8JkfOYGXs9OfVb7b+TDIGwLCYGlPRdfGMxdK+awB
 fxhSRSfvGOEowYeGbptF91KdnFGXlLnvp9+UGYNBBjf2sOBluw1e9IC/mYvtkZbPqyL0
 mFAJmU+s4bz2m8Bdaj1fpqekrM9VOvj5eSIQ/I5u5TV+bo41vbhFsFOsX7blBWrbIsOx
 Wxfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=IF9fJL+VeAQcEJG2C6t3bkzt138oQ5+LBv8tEkVKhEg=;
 b=dc/FpYybM9xI2/fxbjbU7A5F7o0UR0ovXvXZcv1lH34j1YPe4vWDG/U65UY684Kqk1
 voAOA/b3l2wXGZ2vtQHONzOjxgzyuiCY589q0tmyg9G4ixhZ0czxRT9wgFx6AW/oSIIi
 Z4Q60ftZ2bzBFNeBY7ljQDDAsiFlwnVa0o5hA5JCRiuPP07qDxlDr8UoODqM6udLP6kE
 RLRBxY+iehqZwAlKMas0fIzc0rfbOhZQebovBBvWUhBbfJtFSLuDXd4esNxdaNI7IzUH
 ExoQtmKUVlSdLnvJQLQDPlCvdNY4kBW6VRzYLZ1v/WfPPkGxArDTlp+MmIaNqr/koh9r
 80iQ==
X-Gm-Message-State: APjAAAXYSLiZrzSV02lJKs+a3HU9repOJ+sKVy/ZkeVQAwWGXkvvoKGy
 impdQhmva5J8o2lTt737nK8CbYojKEY=
X-Received: by 2002:a17:90a:be06:: with SMTP id
 a6mr1066370pjs.92.1566944946939; 
 Tue, 27 Aug 2019 15:29:06 -0700 (PDT)
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id n24sm226694pjq.21.2019.08.27.15.29.05
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 27 Aug 2019 15:29:05 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
References: <20190819213755.26175-1-richard.henderson@linaro.org>
 <20190819213755.26175-19-richard.henderson@linaro.org>
 <CAFEAcA9qN47t8zXJ7X3TmhkigSEjf+esxVNwQ0m9X=qa2KF_bg@mail.gmail.com>
 <9fe4184f-7483-4207-2536-16ee798f3747@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <573345b1-5ea2-b88c-b07e-0281d2ea6f79@linaro.org>
Date: Tue, 27 Aug 2019 15:29:03 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <9fe4184f-7483-4207-2536-16ee798f3747@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::444
Subject: Re: [Qemu-arm] [PATCH v2 18/68] target/arm: Convert the rest of A32
 Miscelaneous instructions
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
X-TUID: nXBWcPzA5r7c

On 8/27/19 1:01 PM, Richard Henderson wrote:
> Other constraints, such as rd != 15 or imod != 0, should continue to return
> false so that a (potential) grouped insn can match.

Eh.  This is not the answer that the TT example suggests.

So far we are able to order the grouped insns such that
decoding directives like

    if t == 15 then SEE "TT";

are respected.  Since we do not generally do a very good
job of diagnosing all of the UNPREDICTABLE behavior, we
should not rely on getting all of it, e.g. by requiring
that if TT diagnoses some UNPRED that STREX also diagnoses
similar UNPRED.

I'm going to walk through the patch set and fix these.


r~
