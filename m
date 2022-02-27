Received: by 2002:ac2:5cd0:0:0:0:0:0 with SMTP id f16csp1123358lfq;
        Sun, 27 Feb 2022 06:54:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzYxJwQXe3b9gnh9rQ8jkAQeOmHrqRdWbZ1Q6gYHSFZqzCNs5aSSGmcBT7fQESWgv4Cwzzz
X-Received: by 2002:a25:4247:0:b0:624:11c:49e2 with SMTP id p68-20020a254247000000b00624011c49e2mr15016550yba.634.1645973674887;
        Sun, 27 Feb 2022 06:54:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1645973674; cv=none;
        d=google.com; s=arc-20160816;
        b=s3dzVsnbiK+ayxhioJhWb2TB52p7y2MJyw+hMW7z5UNYBmIAIO7q2DvPByo9d438dT
         glUE0dLykmzwqR3+5feio/eQ/pQEWjFZ+cDHgzOSDxobEUnx+Buy9RMoQEohQL8avrTW
         piPjPvj2ll2SuLYXbure74WWpTN5vyngLoyOguDRPWGDlcFtwXvttEJA9vKwhnNmxCKd
         1CwbovbFGWyBQ/WKQceAx75QDcxmUej6tNsT66kId/APRbVqeiuaEbbJyY5kCrVvGBv3
         TmSKq/3WW9iiHNqaPYA6VbiBk/cvBEAH/TC/6n4v4KbbIvuXVK2ny5XyFIV9qZsYFNPE
         da1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YES1o/SHQ/DUVdAllyan+tQ4cQOmF9CmG4oSpQCE0MA=;
        b=hGxIzsv+09GBbWMQ9hKCQmTVUwX5Fi4GdxAuOXw2wjTY/ltp2sXgTkD9YtvMcb/iq+
         7YrsGBHC0GsXMCoMq2WBI8e7NIDx400njOS2LnI9Lh123RPWUB0YSsfNO7/a2AKRxt3q
         PQGppSwpotEuEbqicXqojjEuaMvgBUOtYL/TKoLarL3AXbg/+TNWEw/yJT1n+kmq4GS/
         ujroLBBAcIGCXRgORdeUef1hsgwObd0B4om+4TkDx9fGWXIkCFm9zyssagLiy9qjND3h
         QgjuGh9Gop5duY4OIWqTR/qVaYMADShk9r4fmbVhlhYNocR2622W98e7W6Mk0MQxlf90
         yjhw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=H8qecvJi;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k82-20020a252455000000b0061fb66a5ecasi6065611ybk.478.2022.02.27.06.54.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 27 Feb 2022 06:54:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=H8qecvJi;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nOKwU-0004pq-Aw
	for alex.bennee@linaro.org; Sun, 27 Feb 2022 09:54:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nOKwI-0004nT-2z
 for qemu-devel@nongnu.org; Sun, 27 Feb 2022 09:54:22 -0500
Received: from [2607:f8b0:4864:20::1132] (port=33547
 helo=mail-yw1-x1132.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nOKwG-0005La-0p
 for qemu-devel@nongnu.org; Sun, 27 Feb 2022 09:54:21 -0500
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-2d66f95f1d1so82563407b3.0
 for <qemu-devel@nongnu.org>; Sun, 27 Feb 2022 06:54:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YES1o/SHQ/DUVdAllyan+tQ4cQOmF9CmG4oSpQCE0MA=;
 b=H8qecvJiweDna1OiczL2Uoo+j3TLzQmHFlvKnpLOUAiU/filB2j1AxxqedHN7bGL0r
 XVqqEue8mfCNUJy70ktqNJgGJbNpPaOUgWwvzASLQQYoXLC8amkJgkE4rdFMf0a29XdN
 loxEY9hj0+NSJ8VVzA3/vFthoc3VURBpcNs4Td+/qJqCy7FNe7ehz4VudPfOPuCxMA7r
 bBS9ECxdqWppCx58H2DQ/+n2LOdZBBZVZtts/XG8FojLxrbTNnhKBlSlHP4e4vcDRZTJ
 d/WlcK8L1q62gnrIhhUyxdlD/oWXp+F0FPo5BvFOME82lpyRZoB4rQGe9B7HrOx9VPw+
 oaeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YES1o/SHQ/DUVdAllyan+tQ4cQOmF9CmG4oSpQCE0MA=;
 b=z3xd1L4kDUs83mRRAZxBU1DGGtYaFdeGHpX5diQucvJnv6B+6YRb8fSEsSJ2iksShk
 5Dirt+YSIpsNcCJ9R9xvNqACUo+bubnzamBSGhCu3EqUddPZzScVXnO/ZunhJn2ReVrx
 UxUtBDlIqm+8ArIBhZ6EAgbx58pELFDtMMWG7KxubZTFhMsfVmy2KddKW2AvcK3XF3Rn
 jjyDziPEE/dbAy+N4GuySptlJ91IIPIb/xyux93db0ibtS9thbj1VsmklBSwOGcDy5Nm
 7Rdr+9brT1br2B8LTYzHoT6EfElan559uqvX29jIXU0WHImNQ8VHZZ3D+jqKFYtkePFd
 Z3Xw==
X-Gm-Message-State: AOAM5326ApVovkeOk+sVyqQCORX88sGF1sczdqqhCu8bIHp9JSF4Mk3M
 p1VD9DFo/q4WeECYNXN2elLncbEOcmAfqZjnQ+SpJg==
X-Received: by 2002:a05:690c:314:b0:2d6:b95b:bf41 with SMTP id
 bg20-20020a05690c031400b002d6b95bbf41mr15895319ywb.64.1645973658576; Sun, 27
 Feb 2022 06:54:18 -0800 (PST)
MIME-Version: 1.0
References: <20220225174451.192304-1-wuhaotsh@google.com>
In-Reply-To: <20220225174451.192304-1-wuhaotsh@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 27 Feb 2022 14:54:07 +0000
Message-ID: <CAFEAcA-4W+EOkS0RnXuok4hM=Ng813eSHcaafByuc+9kC0jweQ@mail.gmail.com>
Subject: Re: [PATCH v5] tests/qtest: add qtests for npcm7xx sdhci
To: Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1132
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1132;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1132.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: lvivier@redhat.com, thuth@redhat.com, qemu-block@nongnu.org,
 venture@google.com, Shengtan Mao <stmao@google.com>, bin.meng@windriver.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, hskinnemoen@google.com,
 kfting@nuvoton.com, qemu-arm@nongnu.org, Avi.Fishman@nuvoton.com,
 pbonzini@redhat.com, maoshengtan2011@gmail.com,
 Chris Rauer <crauer@google.com>, f4bug@amsat.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: M/4lYW8bgUTX

On Fri, 25 Feb 2022 at 17:45, Hao Wu <wuhaotsh@google.com> wrote:
>
> From: Shengtan Mao <stmao@google.com>
>
> Reviewed-by: Hao Wu <wuhaotsh@google.com>
> Reviewed-by: Chris Rauer <crauer@google.com>
> Signed-off-by: Shengtan Mao <stmao@google.com>
> Signed-off-by: Patrick Venture <venture@google.com>



Applied to target-arm.next, thanks.

-- PMM
