Received: by 2002:a17:505:8d87:b0:1be9:327d:8ee3 with SMTP id ri7csp1872138njc;
        Mon, 22 Jul 2024 05:11:00 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWc6QNBNapoV4Kh6EsEoVX/GMdqWwsM4RM+obwWxOON+GwRP5xyrVxNjFObkaI3bFh7uA4Um1cEDO81ZkWoG8T8uRD95YK8
X-Google-Smtp-Source: AGHT+IGXEgsmb7cMLiCjxhAX/DO9QdTbHd2DQDCVmUREHHy7hA9Kf78aJbhrvwFpBlM09E5YOwg7
X-Received: by 2002:a05:690c:2a82:b0:65c:2536:bea2 with SMTP id 00721157ae682-66a671049abmr81142297b3.19.1721650259808;
        Mon, 22 Jul 2024 05:10:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721650259; cv=none;
        d=google.com; s=arc-20160816;
        b=BcvUtVDpYzMEqlbjlLaqKC6+CwZh6B4Awf7FpjQJcvJ23tkuPKbydvt8Dq2TRrObLg
         c2BFac/NbRxLeLS1gMQ2HctpG6vs4Xof0i9oPdR7sKhNoiHgx/XiNddMemrzxwG/kV5p
         h/5Y5hvlh/uYPsw3QE4xwruIjdbui2RQ2jtFvAdvxL7YXNCJ59/7CuallZK/ButeWV/Q
         jNaF5vMkjtMBhaW94m78QVRcgwMKO156dZaGkA5j4hY5IohanDS5evI/ogqBJZGzCpC6
         xD2AnPLO61SnESbrjFHvm5AMQZU/KOWDsYJs6S42H3LXsRNtnM240EVs+hFXiI0uG1ov
         1B3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=3i5WWdcUMIgWDsmljU5u1tGWc4zOBYscJlhCvi739/Q=;
        fh=35w6WhGt30aZJWQLsLRC15aga6h/l8+fjLKdcmJabIE=;
        b=J1g2JOXe8Xsu8Lscn+Fe64Gdg3Qziw3tyDRJWuQg++3a9LDChXmka6Lw7zD/177oNC
         tdxkGrbLPhUoYgVsYOXC5ZuZx3hJqmPGmX/J3flD44vXvnonx3/wYWJKse9lo5H+xN4z
         iyO/3nQUGku4nA3Gm1TGmEf2DKuoUvCTkW1NhaAzoBrnqL/vyEyQNmKg1FAI2Fc+VkMQ
         eCRpASleh87XgD8D6+HRgHGkEFdyG2HBOIRcD5OkofnzM+Iqk+KFvVSW5XIvhbCbS2tJ
         r5u5xxrOuXEx3+BWidAschESJF0vEG/RfMUgMrVA1fZ/oWm7+5A5ODySFlxoDZRt21rv
         p9vQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fq5yl5dy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7a19908ff09si765579985a.553.2024.07.22.05.10.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Jul 2024 05:10:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fq5yl5dy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sVrsD-0004hL-W3; Mon, 22 Jul 2024 08:10:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sVrs6-0004Cs-GB
 for qemu-arm@nongnu.org; Mon, 22 Jul 2024 08:10:30 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sVrs0-00009s-AB
 for qemu-arm@nongnu.org; Mon, 22 Jul 2024 08:10:27 -0400
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-5a1337cfbb5so3711381a12.3
 for <qemu-arm@nongnu.org>; Mon, 22 Jul 2024 05:10:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721650222; x=1722255022; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=3i5WWdcUMIgWDsmljU5u1tGWc4zOBYscJlhCvi739/Q=;
 b=fq5yl5dyHgGryEztP6Izi7K1jB/YErBs3MdcZICtrY80fBFCAaFNWF0kWko37TZwPh
 CnPtW3fmh3IVbec3GtsV6hTRcd3U8OWwrjimQA6vI7JbvDOFhig/tipHDOG+MMxqrA7M
 KcMuAMzUDW6ZprepQb3Qbhm9U/iUM3SixE3jWw+qiwzpyZ2biLNhC+/lkbMH5lkE0ox0
 gYvntXewKEWDut2TbgypFD7JdCA9cvS3Us9rloZat6ckVTC4NrCbhDR81ETR7u0Pbss9
 5YOO+8zyXS97CQmLzdW9yzEGVCvCxU0K/3Kd8q6RP1muzeFkQ6uDUF3TFozPsTWYHQTl
 xwqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721650222; x=1722255022;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3i5WWdcUMIgWDsmljU5u1tGWc4zOBYscJlhCvi739/Q=;
 b=YVnK8G5gVbSAEtNhr6h75o8wfRO14i4CMiThyL7tu+t2tPgHACL2xc2f3zJFdIVW3o
 o6YzY9NPHsQJNV0mBWsDOj7SVAyQqXzcIcZLTGkvgZArvEhZ2I414taKzBno8gjDr9dN
 YIDP0bJhtLryecxJNtRsm/jTIzCdzvpTO5JdQxcl44f21k+Uax1Q/kxzkzo+3ZWR5KXu
 lVy/pNegzdYgbE4hsdy0sXACqTnko/nwREIPqO+aqABtHGXhc17ULjArFUl/bTp0A7FX
 wznqNJwBXVJ9lG4dB2S+hPkAjjlaO0Q7GggRuJsUjsNZ6yH8o1ftcD4I0bu9qOBWjE8h
 iL2Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXqpgl7UxyoxqJD6zrT9sc9CGM9QiDaaQ5m/FFiHLzrnphadTf3F/5GMvE+oLpXzseuv96T7fBRDnMvKOGYJsdNWrFU
X-Gm-Message-State: AOJu0YwpbNzQOL8hV/aKSt69DPZ/nZ+Cb5c3QAisZPHtUS0Bcfy5Trxc
 wM31W1qJhCtPr2Qukzv8Kjsjf2J5ZCAGNmDPJ/Aj1wdNrSByzf04Qx6JW9/U5pHOygCJxr7XGqg
 BbV0/VBaIv8v2/HVbXlHoV6pWlTdD5c9kQm59HQ==
X-Received: by 2002:a50:9e66:0:b0:5a2:f154:95f4 with SMTP id
 4fb4d7f45d1cf-5a479b7295cmr3628146a12.22.1721650222506; Mon, 22 Jul 2024
 05:10:22 -0700 (PDT)
MIME-Version: 1.0
References: <20240719010707.1319675-1-richard.henderson@linaro.org>
 <20240719010707.1319675-11-richard.henderson@linaro.org>
In-Reply-To: <20240719010707.1319675-11-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 22 Jul 2024 13:10:11 +0100
Message-ID: <CAFEAcA8yoQuQCOfnZCd4N0Uzm3RUwDqbDtyBA_164bJMVxRDsQ@mail.gmail.com>
Subject: Re: [PATCH v3 10/12] target/s390x: Use user_or_likely in
 access_memmove
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-s390x@nongnu.org, 
 qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x534.google.com
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: RTnxBB0EhS+n

On Fri, 19 Jul 2024 at 02:08, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Invert the conditional, indent the block, and use the macro
> that expands to true for user-only.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/s390x/tcg/mem_helper.c | 54 +++++++++++++++++------------------
>  1 file changed, 26 insertions(+), 28 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
