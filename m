Received: by 2002:a17:906:ce59:b0:9b2:89ee:1eb8 with SMTP id se25csp1217941ejb;
        Mon, 2 Oct 2023 03:22:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEv2FBuprtOAvYz8NExrJzcclgahRPybdU1eEnN7QlZIrrkn34NQATbnv/057wYTizCqEq0
X-Received: by 2002:ac8:7c52:0:b0:405:396e:f059 with SMTP id o18-20020ac87c52000000b00405396ef059mr14368000qtv.33.1696242157989;
        Mon, 02 Oct 2023 03:22:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696242157; cv=none;
        d=google.com; s=arc-20160816;
        b=q9jqocwDh02vLrlJNLsAp/p93pNlPtBJcHggJJouK6XknseLRdnH/TyhcWC61uyj6H
         vD8oQRjnSHMAr7TVgBOsXZReS4HnxGHeEUajtChM6FiNWpRbXNHUcKkIBV7aosPWCx0m
         SWkogKgsRrafky8v3i4OqPi2FM1eu8yDr6T0kTkdJL6vh1gYRVAOXRXTgDkiTCJt/SSs
         2AfpqOG8dFdOeOcoIFmwGCHHVtJKHm4JGe9qLTmoZfhfPqCIW67s0SW0rlfRFHlh1Vk7
         /I5jSfAjEoCwJI6Sis7rTjNEXOoNHCJXzR2ale5+qJ7KHob92WYSr7rK9WTo2amFhVUU
         Ck8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=GdCmToBk92WOh4SDDJLk0orFWiB7ASevHTmTNoQRonU=;
        fh=0YMfcPDF2LUGhvTzsKcb4Nu3ZpHdPY3pg4YW+hHGD24=;
        b=j0soF8DXzJPCFQvz1PcaT/+bkajm4qCUg3VvoOG0UivS0pyB73EbQVkICfZ3bvue7P
         nywdU6cJqGWo1T8GNNArXVbesZ9cb1PRHDGf53fI78Jn9D7sUvANz62OZ0VfQQri7GNa
         YhT8XnrCHueLYoR4tDqA8KYkCdyu3rJ2FfL03Fu/H887HrvaBhBSbzhHBF7YmkydKsSz
         ROdH6BH3mwfm6Q9zUivTDpvVEPbp5nQmSp+sfZtiUE/ntN86CRy+rvXZyK8imP47uCdH
         LOPilmIhFXxLv7CQ6u/E7hNFeE4/VUznMBYovV9eONS4a1Xj1jdRanNfiCTHTaNGwee5
         fIUg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FkxMW2Ly;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q14-20020a05622a04ce00b00417f34c1f6bsi7358893qtx.576.2023.10.02.03.22.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Oct 2023 03:22:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FkxMW2Ly;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qnG4O-000874-7g; Mon, 02 Oct 2023 06:22:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1qnG4M-00085k-IC
 for qemu-arm@nongnu.org; Mon, 02 Oct 2023 06:22:31 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1qnG4K-0000zH-7v
 for qemu-arm@nongnu.org; Mon, 02 Oct 2023 06:22:29 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4066241289bso23076185e9.0
 for <qemu-arm@nongnu.org>; Mon, 02 Oct 2023 03:22:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696242145; x=1696846945; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=GdCmToBk92WOh4SDDJLk0orFWiB7ASevHTmTNoQRonU=;
 b=FkxMW2LyAdU3q7fDd516bIFZlNZI0ZG6vQVINbhjq4M0Kf7teR8LPub8bd+uUZPiWy
 TqYDiTs5vuUkQXKoa5prYu1eR376BcdFlMxvQRgozNZPgTXBLUVFRETS9DTx5prADQVk
 eqEYbDV/mE5RcvKjGQ4VEJq9QeEdgJpTmDUj+L0aML3Wd2uAB49x0kEoukfE36sP4IQQ
 OGvpOlVzm9IswWqfJXl7XzkisnBZFSqPs1/4JwPEWNN44/isLehg0HfYRABdBmLAjPdD
 8xVhZPFeM34vocKkEIQySF7gfvkrN0C23GG9fZgVnQiduj8YLC5kBtlWhKA65S+LQq0E
 Inzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696242145; x=1696846945;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GdCmToBk92WOh4SDDJLk0orFWiB7ASevHTmTNoQRonU=;
 b=KMjsGcIHaQcXj6VFNNL9xa+sYoyGEUi8rbnzHIlmxA3IvSHtWke6AS1TswXmcz3EGD
 3aaDzvozOqLM65YdTu8aZuu6WIeO+oyff1+X0ZOuOGbJcuAjT+MMdET/Ie1dp11aG84d
 NO8ibG0BJPoEWcF4TdtLDIi+QQBtMGOLZ8geTBJiwORTmusxzThoXAppGZNtQ87+c4YO
 CFxv6BhanV/lghG5ztRKOvksO7A6ja/2WRjvJeHSWSFwncydzYXLTMg/kPRglOVHWSEC
 vymd5+zM1Ao6Ryfhb5dPE3ZKdTANBsptf4jJuPtBCqJfZ8evyVKQln/slCg6eNUSdRLC
 6Kkg==
X-Gm-Message-State: AOJu0YxHEOsptRx6QyJeYkRvysYHAxhnRRwnEJ8zhvLUNYptR/TKHyBR
 P6xSodBAI6sfUWFU9LTYAPP52g==
X-Received: by 2002:a7b:ca53:0:b0:405:3b1f:968b with SMTP id
 m19-20020a7bca53000000b004053b1f968bmr10097063wml.21.1696242145617; 
 Mon, 02 Oct 2023 03:22:25 -0700 (PDT)
Received: from myrica ([2a02:c7c:7290:b00:fd32:2b31:6755:400c])
 by smtp.gmail.com with ESMTPSA id
 x13-20020a1c7c0d000000b0040472ad9a3dsm6879394wmc.14.2023.10.02.03.22.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Oct 2023 03:22:25 -0700 (PDT)
Date: Mon, 2 Oct 2023 11:22:31 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Itaru Kitayama <itaru.kitayama@gmail.com>
Cc: qemu-arm@nongnu.org
Subject: Re: Quick start guide on RME emulation
Message-ID: <20231002102231.GA3075015@myrica>
References: <CANW9uyvsD8UWJ9yrrvgb4i7nEoDAXNaepk-zsJWuyw=tp_W9oA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANW9uyvsD8UWJ9yrrvgb4i7nEoDAXNaepk-zsJWuyw=tp_W9oA@mail.gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=jean-philippe@linaro.org; helo=mail-wm1-x32c.google.com
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
X-TUID: +9J2F7G55Qfo

Hi Itaru,

On Mon, Oct 02, 2023 at 04:51:46PM +0900, Itaru Kitayama wrote:
> Hi,
> Is there a doc that I can refer to when emulating the Realm in QEMU?

What kind of doc are you looking for, details about the QEMU
implementation or instructions for putting together a software stack that
boots a Realm guest?

I could try to write something up about the latter based on my workflow,
although most parts (TF-A, RMM, Linux host and guest, edk2, VMM) are still
incomplete and out of tree.

Thanks,
Jean
