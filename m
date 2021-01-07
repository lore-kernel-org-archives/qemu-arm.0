Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp482930lfq;
        Thu, 7 Jan 2021 09:40:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzVfjwstmcQm+XCgJhSzGpeY0O8HoaG2hr7DWHdFHIkc31EpXtJprq9Byw+BnriNDwvppnq
X-Received: by 2002:a05:6902:6d4:: with SMTP id m20mr14943488ybt.434.1610041208989;
        Thu, 07 Jan 2021 09:40:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610041208; cv=none;
        d=google.com; s=arc-20160816;
        b=LNNy6ff3nBHoECpoQQS5lPe9eHCStDAYtHW5q05mVlKml/PTCW/wUJVWaCi7ymbc91
         S2x77he054ik5SV3OpquRQDy+h+tjjY7t2XsDxD4UTUgsKo/wLi2yy+Sn9N57pbE2chu
         V2c0+cloHeQ2ro2TQg7WvA3KoiGO5oITSgJthDvx6Z+U2ltdQ+rwjbujnGnGJcoxgEC/
         J+7TaOAV58zJcHV99LH3HNDJT9ptSTZEX+xtK68Koh06zzu9lXPrwmJWz0XCyWCC5V0N
         sN3hZOZi+5zMNQBfKU/g87VTNDFTfMzu/9BOJLmXJl9RlTLNCDtkD80P/mlfxznnC9eN
         zDZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MBggW2AVDX0YsJ7BhRry6EfhBQlo6lJJIzikM/aRsM4=;
        b=MdHQ77a/6ftEsEJ5L4OOdesHUUAS3NeNVLGZaUXvsd2yMU40cy83lRmhRpVRhnc6gK
         dOmdA/SYD9+Ap+X/+mTYJ5Rvwsx3koEdDf8dwBtRVEg1ZxcRUprTW0PYRkHbhLLMPBXS
         XoKlFp/s4RJXO1ufLenATtVC2uZxbGtYbErM9GWhFrXU0E6kIZnOGfLejA5ADFSCQde4
         mg8QKoPKT1zRx0LeF8SDKHUaPc4TqZyxPsq7CX29FQt+h7u7ZCSO88IHS0qcuxk81Dsr
         1Cmx7BN5/9AOUSXjFYTTKu8gKFaWDlfzXOOST1O9U3WECqDDXr6R5rFblWak1PeEDJzg
         vmbQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=IqXYHYee;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 67si7365078ybb.324.2021.01.07.09.40.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 07 Jan 2021 09:40:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=IqXYHYee;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kxZGa-0004sp-9W
	for alex.bennee@linaro.org; Thu, 07 Jan 2021 12:40:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxZ8z-00065m-7Q
 for qemu-arm@nongnu.org; Thu, 07 Jan 2021 12:32:17 -0500
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:40939)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxZ8v-0000Gp-Bg
 for qemu-arm@nongnu.org; Thu, 07 Jan 2021 12:32:16 -0500
Received: by mail-ed1-x529.google.com with SMTP id h16so8505701edt.7
 for <qemu-arm@nongnu.org>; Thu, 07 Jan 2021 09:32:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MBggW2AVDX0YsJ7BhRry6EfhBQlo6lJJIzikM/aRsM4=;
 b=IqXYHYeeq37y+QYAIgmmyqeXqoeCafcl6e1cFXjAb36/iaKjRF7PTjxc7yrtmryLCf
 BECDf8bmP4guNrKa1vEFDlJIgV539qfxbVokRG1I5uu2WXoyT5xorYAQauDJPwUDerjv
 mbHodBV5jBhap06x580htLRZ6VEDiKZEPfvN+qA8TtfUG6ptEV2ykYbNurpCNitjpWCB
 VezsITr9XYm8S1q8hxH2Txf13xeS0Dd2gXtHtEszqfkOHdfGIPVrZ31DDbZ/mPXlo2+5
 I1X/z4ptRDSN41uJBxp/s9UpT24brJ+cjMtOxoicJs3uW0CtvqHg5IXyBi5xcfhoj7oi
 ZGwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MBggW2AVDX0YsJ7BhRry6EfhBQlo6lJJIzikM/aRsM4=;
 b=cBApOm9WUbRiwbVuW+5K63HvlysasBlzZTidbSeufLJEUU1g3WNXkAyhtPS0Z8vbIm
 NmQgdctZ2Moi4hnnrBtKAt9o+VYbI6jJxCSfOqAaNENKUwpNJIejzqXgm53DhZgHHwFW
 f2DRXNXOAtUjekr4a845e6IgBSvFdGWJAYwqTLrzMdluBB8F/1qpBnkS1dsQZdlg2tIZ
 oKMVaQYQjAUnHJvL4+bfQYNlMpDa9uyXi/IcbABJR1dqNAFvkQAnhp6Sk5u4b6dfBJ+K
 RuH7MXdWGOnpTtI3gu2DMk6T5fC7aS3dL4Bgi1H6XZMOZXZ51xmfFvRxUd9c7mHYhfuA
 95nA==
X-Gm-Message-State: AOAM533z8Hde6INIkzaf3hNJy6UFuWBuwjw47eWc0V5upl901S4z/bfr
 /NpfFTBbQo8ijq+nGuUoLxtfihiBIn9VXPsoxZM22w==
X-Received: by 2002:aa7:cdc3:: with SMTP id h3mr2423803edw.52.1610040731556;
 Thu, 07 Jan 2021 09:32:11 -0800 (PST)
MIME-Version: 1.0
References: <20201208180118.157911-1-richard.henderson@linaro.org>
 <20201208180118.157911-20-richard.henderson@linaro.org>
In-Reply-To: <20201208180118.157911-20-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 7 Jan 2021 17:32:00 +0000
Message-ID: <CAFEAcA8xvVKYGiXpDiE6yr0mzN0aMOGoKhqaVMc1eKwNO4HbrQ@mail.gmail.com>
Subject: Re: [PATCH v2 19/24] target/arm: Enforce alignment for aa64
 load-acq/store-rel
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
X-TUID: rjN93A4Utlgv

On Tue, 8 Dec 2020 at 18:01, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate-a64.c | 23 ++++++++++++++---------
>  1 file changed, 14 insertions(+), 9 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
