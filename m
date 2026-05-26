Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80697CD5BC8
	for <qemu-arm@archiver.kernel.org>; Tue, 26 May 2026 10:43:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wRpFg-00063S-3y; Tue, 26 May 2026 06:43:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wRpFe-00062x-UJ
 for qemu-arm@nongnu.org; Tue, 26 May 2026 06:43:10 -0400
Received: from mail-yx1-xb12e.google.com ([2607:f8b0:4864:20::b12e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wRpFa-0003ZU-FE
 for qemu-arm@nongnu.org; Tue, 26 May 2026 06:43:08 -0400
Received: by mail-yx1-xb12e.google.com with SMTP id
 956f58d0204a3-65c52bb5dd7so9927185d50.2
 for <qemu-arm@nongnu.org>; Tue, 26 May 2026 03:42:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779792177; cv=none;
 d=google.com; s=arc-20240605;
 b=k9l7NkfY9xzs5Nunsgscqi/HkBsrPYS07FuJI4AlUqHHgvXKjZOCPou650ddPzR7w2
 O6yF1maFkfz7eAwJY5FV/LoMxKvKYyvn6iMM3g1M/jrjFY0qQDqbOJM8SUrZd0n9tJYz
 EHu74K71Qd6DQ5EJQTJC1K9EfzYsZu8uQW+iSALbAAh6IkAmYCPcZRB1IPj+/n8TP9Lq
 FsWu6gZ//B2hU2QEPiyyYNk7RqNUuO2+XRqDLxiNc5/9NSa2McSVW8h4xp0QEDooQMx4
 iSlUp4Mu/U7Md3L2YVqzkYtU2PteE04yKrxVuTnpE7ZrvTBpWGi7ZCBNS1mqJfJYrk0U
 dzEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=M/UjtwWeJn3BV8j/cB5oDZf5o8Psj2+8LhjOEwpeKPE=;
 fh=nhfmkjb6jgCjUVKWyD+kLli06m3KyF48Y019mCNlvPw=;
 b=CGZrRsxfHHhHGVbxz/SDDYyFEBMRQOXYZgq5uY48tCI+O5ibu/yZoTfHb/yCb8v3ar
 tRzAlYMSUb3z5dlaY1ItBjffsDQpbDFLH6pTAhmWlHf2QBCBMex5vrfJ5FHSLFp7/VUl
 tPdLaWWZKsMGBjpFK1cHe69MfPnn+HThM63k+OnCWzq3F50zTb0Zfs17hzQ5JbDUgzrk
 bzPML6zKXgTJZYuyeKayB2RVwPXcMkBnnSHANLR6Xp0OOqZkbh27+yybe6M8aAFHroBl
 pzgW6aGyx6GkTZ4px0cfzfpnCvr8zh5uZL1HEmbsOlmlN8W3GPhMVf6nopw2rXv8/Ha5
 orpw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779792177; x=1780396977; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=M/UjtwWeJn3BV8j/cB5oDZf5o8Psj2+8LhjOEwpeKPE=;
 b=XsEy1gC26etHDgynCrOotamUoSVKcRoS3qiDQCKF3ypaNfvPOjVGGHAkB7KSDSS8fP
 zcGzAcQMS+s5u+JUYBihsywhXR7jCHzqSQIubZg0mGwXE3114bawo55PuLnXi5YXazHq
 hR4zob2/r0d35Hzh3+z7B5huzN/zK5TnpuVCRiWcbc9xw7hhOI48JGXMQEJgmLQiQC0w
 3F7seCjg02mvDQowfqnp7/9944DT+0n3sAximjFy/gGl80zEodpZ3U6Gu+WKPaS2RtWp
 BwzXsu0sKrH3wPVD+mW4UMNiKtMS49beCMKvptm346lF15umsX5yI7Y/NzorlxnCnB96
 9CLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779792177; x=1780396977;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=M/UjtwWeJn3BV8j/cB5oDZf5o8Psj2+8LhjOEwpeKPE=;
 b=FLloCmtTO4JfnHQu/Es9z+MWdBiIUBqeJO9UfpxKTegVrBmwwhrEra24z2YF0ByDkH
 aejfNc8ZfTkzCHJUUuDGIppU3P2nbQuyBUQ1KKk9q7m97Ghw3Qg/DoTs2hrGBV+1mkXV
 d5Mx32yPsm2htFTX7H9zftJVtZ1TCKhzt2OBhafaCYPXjDnQErtC9aVa18H68+axpyht
 +hbrUR5fTO4TzpC69sBc3N+HtQ43iQKj4nflw1MHoQ2rqetg+l6ig6p1/71k2mcyEGM4
 A6YQhYUOUlSHsFnmnGdnB+7cP7+lblvKXbvk0EpZoKE08ieMwAw3TcF34/kIlqeZP5mm
 d5Ng==
X-Forwarded-Encrypted: i=1;
 AFNElJ8Ox8UHKxGetS7Wp8VF9V2JjvNfQaU0ByVuUK8KOy+m2b89ErMwQYImoPwkbJFsAm8c8JM6MOmsSA==@nongnu.org
X-Gm-Message-State: AOJu0YzSPhSIR01auGftq9WGU49urBK/Ixv3nFhxQtxF532CCp6o3eKo
 p0cYta6hb3DBZLXrQFk65YO66XdRu4qjmWT+YmXfgvQwG7+8cPoMyRFYeH1Y7A7ltVIeosgegAs
 s930Z4arbo9UGZWVGJO1aytQeLUub6lKN0vzh9B1nuAQdGx2gdmWm
X-Gm-Gg: Acq92OH22WWkLtpqL9AH0npt9cgcG/29MmClSShIXoaYMx25AA/22RspHdj6+MzOKp2
 Y/L7C9SY1pdcYkJNMBNXNAqV2aFoUnaazpfpckBr+PpgBRlSEMMgA1w8gKwa93tmESNB0Pb0o2E
 q15XV9nKQTBrXhD1yLi7U6XhiXGdSaeFCwndWPlLdoF2frlFo6By+0mhBSnNDQrd1ApJy4nyEVX
 6z1asgtWfisPw18R459MNnUtSp1X8L7OT3Bvp9MbgTpO2t/RaG9WWpWMvbXYMniSeQ4fLO7NXpi
 LWk8wkquqZzkOanMgw0wz/R6kj+D9EICd0i4Tgebd/YXP9guTCJqSYi8dwKiUYP0HRg=
X-Received: by 2002:a05:690e:140c:b0:651:daf6:3d82 with SMTP id
 956f58d0204a3-65ec98bdef0mr16952737d50.42.1779792177020; Tue, 26 May 2026
 03:42:57 -0700 (PDT)
MIME-Version: 1.0
References: <20260522220306.235200-1-richard.henderson@linaro.org>
In-Reply-To: <20260522220306.235200-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 26 May 2026 11:42:45 +0100
X-Gm-Features: AVHnY4I1L5gT8Sq8fEIo0Ks2_EflK8xAj3C3OWx2scmoctjfNXRsNjoHET3Lx9Y
Message-ID: <CAFEAcA82v=48FxXuddVi8JHDFK+Z-nM9Z3oAxB0K-xoO=ZNEbA@mail.gmail.com>
Subject: Re: [PATCH v7 00/64] target/arm: Implement FEAT_FP8
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Fri, 22 May 2026 at 23:03, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Based-on: 20260522182658.184604-1-richard.henderson@linaro.org
> ("[PULL 00/30] fpu patch queue")
>
> Changes for v7:
>   - Lots of patch feedback.
>   - Split "Implement hwcap bits for fp8 features" into the
>     various "Enable FEAT_FOO" patches so that we get 1 or 2
>     at a time; previously missed F8MM8 and F8MM4.

I'm going to continue to review the second half of this patchset,
but for the moment I have taken patches 1-23 into target-arm.next,
since they have been reviewed and the fpu prereqs are now upstream.
(I've added the comment I suggested for patch 4.) That gets us
FEAT_FAMINMAX and FEAT_FPMR enabled, and chops a third off
the size of the series.

thanks
-- PMM

