Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B069606A335
	for <qemu-arm@archiver.kernel.org>; Thu, 22 Oct 2026 10:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=kGEQYU6i
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xJpdf-0003GC-AW; Thu, 22 Oct 2026 06:03:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xJpdd-0003FV-TU
 for qemu-arm@nongnu.org; Thu, 22 Oct 2026 06:03:09 -0400
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xJpdb-0004GH-RU
 for qemu-arm@nongnu.org; Thu, 22 Oct 2026 06:03:09 -0400
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-8b09e07e149so15698047b3.1
 for <qemu-arm@nongnu.org>; Thu, 22 Oct 2026 03:03:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792663386; cv=none;
 d=google.com; s=arc-20260327;
 b=FUUFiQNmIhKr5h6Pi4eMVCR35WBDkha/oS0jW7DnRBc/0YEB8qS/yBzI+f6VpUFNty
 keVtUqGNC1e0LgkQAlEk0ZqaYp+WFq/5+KbnL38Zq5pvzTOE//5cXwqS047OBw9S+Yng
 6tb55L3ZMQrIJBKGe2fjAvZqsvQZjllKoET6y+Jvd6792KBGiL4OfFzpFxxgg7d+FC1v
 TA2SbFQMv80tbH82Qr9ogSuAXuvecLxjEd9O6oYCz+oOQawTdqEu8Hyeu/cT3y0gY5nl
 2ALVtlKCo4RnpmCysUwmAPwUAdGbePvrFcgnYK2AYC7YPqI2scpr1KAWTuN5kUkNS5A/
 eDjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=VQyXgmdD1qRyobtEPRICTfSuPxsKzCbE3omY8esYT2I=;
 fh=DgOo3E6WU8GpM371jSc2lE0w3zCcLkGIxb1uxlYyPyU=;
 b=GzimfjUwEI/27M9KTPI6LidKm3uBTpXF1xkdIGk0Xvy+rz9DOA+gjB7LCyY0eHu/if
 dQBvJOC6gJuqRnDBSwHQP2En9UiFG70KN45OZdECiSbqi9fZxgzN2jS1Rdz3dn09SD27
 wmJF4/gZnOEbFAV4OsI4XKfWan+0olEo3hGL5qJslyT+s91I9SND22SUQCUOfwBPG5A8
 w8qLBjXTUFNvmlflVN9jPCm6b/Alxl35n377q3p3wEcEUaJ2w/iEDh5hz7hsgNeHSC91
 8hkwSdISmQRnE6FAGPsiS4LbnJhJNCccNlxH9bOhtJRC7y/xXx1Gnn2I0zrF5/fG03TW
 5WPw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1792663386; x=1793268186; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=VQyXgmdD1qRyobtEPRICTfSuPxsKzCbE3omY8esYT2I=;
 b=kGEQYU6iNFl/v3o9uNx9vBbN8rdsADsYXgaqg6NYyf1GckJNmcUT0R/tvSWmBIWYt0
 uUodTq11dLNF0tGUsETggssPAr3adwrNuglAnqcNWktIxCCvGIFFfxyAX0cTX04f9NZh
 ePqR8eNvykmUYtAsE5JNpJcdfuASDcxSYbAsBhngkYayTE1WoXwZJutNZ6wEuCW9lR0/
 J/4sP73VZ+WIsBfgA/aXuR+B8Jg+t6YhazypNDRMyguv5TKOMSrRQ5mYgtRluyCIdvh8
 DorRuWpJLb+ReK6ICNnokZn9coRX/Q7qwTehSKUcIQyn7PMGwuBZQQ53DUvzIL/28mDJ
 7WjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792663386; x=1793268186;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=VQyXgmdD1qRyobtEPRICTfSuPxsKzCbE3omY8esYT2I=;
 b=Ilw4X8bhSZPqDbAm40ycyZ/KQ3THdyQwp25JRj54rFAYelnKIqLvkCGt5ANd6GtgxB
 owmbeZPSIe6+rnS4sCbjeLmG/7y9wXForUWVMQA2z8NqWVSRdTaxNXPzlgSgOfvj0euX
 DXr6uSHmfn4UrAEI00WIpvd0fJTyR+uR66E556vsgz1eJAuLJzS6ZeOlTUlRSrodwucp
 4Adx0xBH+GvdRoMEDPnDZ/QU+sZMPp9rV6pIMKobc5TKEHNOyzU8djlBQ3bT6pgOXOP4
 fZPUmsrm+ORCFDhqkvGJfY01nfFkJZEhSxYlNagRzqmgSlAKQIWPxSr3uHnMs6aZNz2r
 a+Pg==
X-Gm-Message-State: AFq9FYLB4Xc/tmUHjvaQVLa8+KtsFWh+FyOYoyYnNZqwB6zY5zNYXvFi
 ueNjxZbu6Chassz4ZEbbKnCYwvhUQUuKMz5dnMnJhGBHcJ9XLqCyZDUZoa1UAfKrefwtDiaO5p/
 24ntihb2j2jtoGGc2DizKKW+RIsNBaUw+m410vbcsu1B4L2LVmukbKPg=
X-Gm-Gg: AYBFou0ZJWXW3+BrCAvPIG1utrSD+HdYLcMXxsreKRzxAhWWhOWqZB77kfmFssUyYmY
 NG5ROTSCFCwFEbk50pslOxEzzECunV+RtbMtmZr2nIqWqnc2vI9FWbq2z2UObmDmbg1/ne4CSci
 v0aosDUD3/Z9yIDnKOsNQ9R3kTCwL0+jMSGrywUBoeLRQQf6x5C3Rr49kcsU8TD/4hHxdImQMYD
 sGyN7K3m7jPnW0HbAKeXVjzxFHrXf9c7eFVw6pbV4pfs6InQ69tE5tZLiWpl4nOL72VuxzcF76M
 DanPRSXImmiy1uIQcw2qN84hwmLarpBA61IEoXYo7DLyfmW0nGs83eHAbCoozZNxhYsN+bRZw1b
 GkEOJBqOjxZzyir/IbTS6N2UZHE57lTrmsRPp6pEkrhgUyP1kkB5Cfj0Dje6JkB6Z0INBStc0a9
 lsdNed2BhRd9SUFerv/s97
X-Received: by 2002:a05:690c:e653:b0:8b0:4f12:d36f with SMTP id
 00721157ae682-8b133fbf773mr16097787b3.52.1792663386040; Thu, 22 Oct 2026
 03:03:06 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261019161900.3271815-1-peter.maydell@linaro.org>
In-Reply-To: <20261019161900.3271815-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 22 Oct 2026 11:02:54 +0100
X-Gm-Features: AclHuK82WUUhfW-HJw5yGT8S5vv5fwU7PGBdk7Hi5IG_nHI3q9KMZUMvt6liVyA
Message-ID: <CAFEAcA9PxT3XGtoc6VG4Bhxx6Qb7+R+ns6+DycpZsn_YA7UkyA@mail.gmail.com>
Subject: Re: [PATCH] hw/misc/bcm2835_cprman: Treat invalid clock mux source
 select as GND
To: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1133;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1133.google.com
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-20.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, 19 Oct 2026 at 17:19, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> The clock mux control registers in bcm2835_cprman have a 4 bit SRC
> field that selects the input clock source to use.  There are only 10
> valid SRC values.  Treat the invalid values as producing no clock
> output, as if the GND clock source was used or the mux was disabled.
> This avoids reading off the end of the mux->srcs[] array.
>
> Cc: qemu-stable@nongnu.org
> Fixes: fc9840850ba ("hw/misc/bcm2835_cprman: implement clock mux behaviour")
> Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/4695
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/misc/bcm2835_cprman.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>



Applied to target-arm.next, thanks.

-- PMM

