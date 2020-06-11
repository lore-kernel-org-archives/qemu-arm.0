Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp1581000lfc;
        Thu, 11 Jun 2020 09:32:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJywxKRycBg0ovz2KjRRYaFhmrYzJLTh6819dpnnngP+TEI9rYkNZ7C+6Siy2GVUDk6Hg5M0
X-Received: by 2002:a25:3f83:: with SMTP id m125mr15285837yba.299.1591893159742;
        Thu, 11 Jun 2020 09:32:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591893159; cv=none;
        d=google.com; s=arc-20160816;
        b=KoDMrE4r0zUuPBucUcXq50LTzLI0zsgMuSf8+gJCcMAqSqHR+bAKJc70tx3Yr4OeVW
         SSHS4UjPm3yf2A54q0fg/7GcA/Z4f3q0j5fe2X6esjhBjpOZLbW0HP62SZFqU6aC9N6J
         QPr5bW84gsxKA4XCNC+kcWXYgqRkEnh/ZXYL85jFiGS3LnJrI2JgpeNNnjB7RDqhu9fv
         sAHeW6o96u1bM5sZd/NsK6nDDlNDEtXoMZzydPONYufxh+Z2gGtbwQsuBthKOwMTWb4c
         FrXTR84x5zI/Qr8YOoDmzIILFMWXZJ6FXdhvWYW04MM/xFkQlfEwEht6972JCWooNl2I
         yo9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=py+5FHz0gv2HmRSnBja2NeB+YV/T5Ene0y2g6hXvAW0=;
        b=ZgNenz4UtCA+79f9+9CZVoxuwc2p0vbiAkcb4m2VOfMtcktwCAnHGYMzwwPxhtuvOu
         zeqlOUFIrHz8/kjCuKQ+0VgRNDU0uVgap4ZLxqekguARBtFn6WBoK3wWoJ3kWyHYCdc7
         XKuLOlU0kxmSh5K7DNC1iqWG+zFjcqaPrvBTL8ofkink/ZFo27ygHcLV/mvYearm1B80
         VPpwrFiuk3yxv8dfKxj9ANAMWw5AwDf49YYdvOkGtke8dzWzCQDXa0Ww/w9hQPbqqcWJ
         o465ycsOT9u2qrJxcQuUwk5xiyS7IKkesSmG+lD4mSBwThc/0OmwBKs8YCll5vPZL+wq
         0rYA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=k158iE1C;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 184si2609219ybg.374.2020.06.11.09.32.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Jun 2020 09:32:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=k158iE1C;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jjQ87-0000pG-3o
	for alex.bennee@linaro.org; Thu, 11 Jun 2020 12:32:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jjQ1o-00009e-HY
 for qemu-arm@nongnu.org; Thu, 11 Jun 2020 12:26:08 -0400
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041]:32996)
 by eggs.gnu.org with esmtps (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jjQ1m-0006KA-9Z
 for qemu-arm@nongnu.org; Thu, 11 Jun 2020 12:26:08 -0400
Received: by mail-pj1-x1041.google.com with SMTP id b7so3247656pju.0
 for <qemu-arm@nongnu.org>; Thu, 11 Jun 2020 09:25:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=py+5FHz0gv2HmRSnBja2NeB+YV/T5Ene0y2g6hXvAW0=;
 b=k158iE1CDU86EHUdy7o2GAlstD+7VMCu6gmgTrJxtbHjzFA1tImZPNGW7uK9J0D98b
 Bu4qC6+Kt+VI0vM2SreTTqR64hQe0kvuwj1A5SnRx0Y4lcyhXwsyNe43Ujxpbr+aIfHN
 EO+lpF+Y9ME8gVmmzejgU5j3laJZWpBKhmW8NMZThxHoHylWWGx0sBa8Kg5ygiVgI59i
 zKXvTBzvE/OyWXP6Rk722Qq75zGFqumZ4Q4K1duKM2vf55wykSa5muVNghl+POgaxyGh
 g6MimcyZQRSGkAvwWClbYZW+1xqo/qZJPMifeMdytwDMJmahFmXq8BDVGqWcRrwpYZcK
 Hfgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=py+5FHz0gv2HmRSnBja2NeB+YV/T5Ene0y2g6hXvAW0=;
 b=ENLDA/1yuCJ5IHlka/8l0xXfla9K8VYb5hrFX2xHRT9Uu6OJYyRIgrIq9RDRXb4dYi
 a8D9gQKESa2zDKMGZ8h1Yq7yHGl30PA5MPSlbSSamvMdabtiHlXD4+vcDidkvos24jId
 8OBK5oZKtwu+Y/j5YvxWYX4TboBGk9tHestzzNPdzipeKwF6ejROdMRqOsiv3C9nakW5
 DjOaXsiRr2lERZBGdm7FPL0UxszUYAN4o4A7hNmGw3Pv/DbJBvHVvw6tplnOljUqgtN5
 a6zP44RBsTu9xtInUv0uufB3csMQSDuexoQcRSyNpeDY+/HdM5hOxO8nmNQBajiUBpKR
 95Uw==
X-Gm-Message-State: AOAM530XrLIwQaxbShNzSkOR2eX76pWjhTpzCf62FDHTqIYPTUsu9UOR
 FwH0W2iaUUL8BMENe4XiDHw4ww==
X-Received: by 2002:a17:902:c697:: with SMTP id
 r23mr7806126plx.312.1591892756997; 
 Thu, 11 Jun 2020 09:25:56 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id f3sm3269390pjw.57.2020.06.11.09.25.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Jun 2020 09:25:56 -0700 (PDT)
Subject: Re: [PATCH 07/10] target/arm: Convert Neon 2-reg-scalar long
 multiplies to decodetree
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200611144529.8873-1-peter.maydell@linaro.org>
 <20200611144529.8873-8-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <de8e8d1c-a9aa-187b-0ef2-eef909ad5a9a@linaro.org>
Date: Thu, 11 Jun 2020 09:25:54 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200611144529.8873-8-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1041;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1041.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Yp2V/l3k55FJ

On 6/11/20 7:45 AM, Peter Maydell wrote:
> Convert the Neon 2-reg-scalar long multiplies to decodetree.
> These are the last instructions in the group.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/neon-dp.decode       |  18 ++++
>  target/arm/translate-neon.inc.c | 163 ++++++++++++++++++++++++++++
>  target/arm/translate.c          | 182 ++------------------------------
>  3 files changed, 187 insertions(+), 176 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

