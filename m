Received: by 10.28.71.155 with SMTP id m27csp6307904wmi;
        Thu, 5 Apr 2018 10:37:57 -0700 (PDT)
X-Google-Smtp-Source: AIpwx48NIM53vKIFHygMEgBQhqezaPIULYr6izaLIxFUxYqpyS0vCWFFk7FEhnyfHVPXW02NiAOp
X-Received: by 10.233.239.71 with SMTP id d68mr32583755qkg.100.1522949877199;
        Thu, 05 Apr 2018 10:37:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1522949877; cv=none;
        d=google.com; s=arc-20160816;
        b=fICAcmBTlRBq+XcO+z1Ma0onZyF9j1vNQhcbTttbiYOh5xLYWmQ35JLSfqO2MDiVkn
         Ni9OXrE6uvVVVkzPqOjtTVRee5ntbnUizOFQOkqtjqIsnE/4T8vo++IWXzg5B3pV49Fz
         5R+KhO8hI1hbqI+fj98vplWaSuPTB2RrVeAtYKzFtLe+BVta4n5z6C6U5wyNm4kGDOol
         VTCGrbuTT1Qw+QwICJN22ictLQcOwdwKReHzOB1TuWj2+0aJogUeLL9M/A5dTQiRB8XG
         sgq5BBPZtaN07usH3ATL2hNVg+CVghEq9AtTvDwuNh5dFDjc1l/R+eUphkPGP1hxcW84
         ZDKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=oJcv0CU7kkXOS0HJyfUAoR5zVagUnlQeWsCriopyiCo=;
        b=p4QBSYCs88g978xtWnCcLzTMm6UlwWgZ//WrrGTsUqCCegGNf/P9CThaIcOJF+3GgI
         OsnS9R4KdpFNqzHvhtRdmIr2D4B/J/4QBC+5XKFuZv4lP9mtaVT5utRMnNtBdWrY4tU1
         GUdV2ZfcLGGWo8lRIzeSCZe0r7zMvt1ItXEq1Jh27D6/1yLNCZLiDFKlP12sehFPVyka
         91JmgZt/XPRkp1wS6DHBVF5aMri21hbDTzpXIUSIFebaF8yfnOSu+RnLcJp5DlS49H/J
         8fUbzEokI7Yk+853vjnJm9RcwpZVZv6+y9sLbQZLX6Xvhz+ulXF/aAaPGr7QNqzbWsDd
         ciFw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=F1CAKxur;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 80si596022qkw.175.2018.04.05.10.37.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 05 Apr 2018 10:37:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=F1CAKxur;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:44210 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f48pg-0001pS-Jt
	for alex.bennee@linaro.org; Thu, 05 Apr 2018 13:37:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37102)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1f48o8-000189-IU
	for qemu-devel@nongnu.org; Thu, 05 Apr 2018 13:36:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1f48o3-0000TR-Qk
	for qemu-devel@nongnu.org; Thu, 05 Apr 2018 13:36:20 -0400
Received: from mail-qk0-x241.google.com ([2607:f8b0:400d:c09::241]:36291)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1f48o3-0000SU-Mr; Thu, 05 Apr 2018 13:36:15 -0400
Received: by mail-qk0-x241.google.com with SMTP id o205so27199584qke.3;
	Thu, 05 Apr 2018 10:36:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=oJcv0CU7kkXOS0HJyfUAoR5zVagUnlQeWsCriopyiCo=;
	b=F1CAKxur1gTUP/hJhwgXLH1taVzx/BJG18QCjvEVTk9LTzWlcWkR4OF+SmNpPbJkZy
	r17HRjmt7nEpGNbXE5J62sriT9ERYPEn6HoRiLwsFppAUDg+lo791kMxr0m6t6GGfBLS
	uMuCl3xM/S4407gSMkqzBmURkpWWbzUFXrgo+zdSKJnEu9LEAWngcuwSFSDECPE+1GEe
	+QY335jv89INqmUvuGPaIWwxY6nzOUfwdtp+5MVpiVaooqyqoXXWT1KKZbPlCA22oJEe
	wvo6dVmdzoQnmfzLAJDbYx/wxSJ7DU4O0XI4qtZIeCaX3Q+uqiyFBfBhtt/TXwzvKisN
	nWlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=oJcv0CU7kkXOS0HJyfUAoR5zVagUnlQeWsCriopyiCo=;
	b=rZdXc2sXtmIEa+QRFtKlCqVeQJBVsd7F0CTYp6Rp9Ly6v7ir+rpCETa/XlLZKNpCHB
	DJ4VyjGQLzYl9JwmSxHalNyxyJyXcU5OM+9HXB92wTrUo0ch1lojmmmqyg+sI5t5aj4N
	N6QnsRsMdtheCrXkngWv24svf8OIyiejg9WStAQGBCCscpdypCDtymIRzgUmSZvRczwc
	aYedGDbCN5aKZhDw7mB8NA9L2uJjyK6chLsEIDM4tcRYj1IZNTocmXSR7YpwPZM+gike
	NIGENm2qh4BE79oT+DszLkHO6ol30dHrx+VzwErNRN1vbn4IzSwfBzOxibswN9ZpP++g
	X/mQ==
X-Gm-Message-State: ALQs6tB9yS6YZfc0kpoGw8TN1ARzVOvzLc8KZ3QhWrmhnwfO/8S1QsRb
	RgvTufU4b+kHDN9RS/ylwQ8=
X-Received: by 10.55.161.69 with SMTP id k66mr31799767qke.55.1522949775139;
	Thu, 05 Apr 2018 10:36:15 -0700 (PDT)
Received: from [192.168.1.11] ([138.117.48.212])
	by smtp.gmail.com with ESMTPSA id f6sm6905825qkh.13.2018.04.05.10.36.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 05 Apr 2018 10:36:14 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20180405172554.27401-1-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <aef5b809-2cac-1490-239f-47ef97496133@amsat.org>
Date: Thu, 5 Apr 2018 14:36:12 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20180405172554.27401-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::241
Subject: Re: [Qemu-devel] [Qemu-arm] [PATCH for-2.12] target/arm: Report
 unsupported MPU region sizes more clearly
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vmOR8kKdI3IU

On 04/05/2018 02:25 PM, Peter Maydell wrote:
> Currently our PMSAv7 and ARMv7M MPU implementation cannot handle
> MPU region sizes smaller than our TARGET_PAGE_SIZE. However we
> report that in a slightly confusing way:
> 
>  DRSR[3]: No support for MPU (sub)region alignment of 9 bits. Minimum is 10
> 
> The problem is not the alignment of the region, but its size;
> tweak the error message to say so:
>  DRSR[3]: No support for MPU (sub)region size of 512 bytes. Minimum is 1024.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
> This doesn't really need to go into 2.12, but as a cleanup to a warning
> message it's pretty harmless.
> 
>  target/arm/helper.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index dcb8476d9e..b14fdab140 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -9625,9 +9625,9 @@ static bool get_phys_addr_pmsav7(CPUARMState *env, uint32_t address,
>              }
>              if (rsize < TARGET_PAGE_BITS) {
>                  qemu_log_mask(LOG_UNIMP,
> -                              "DRSR[%d]: No support for MPU (sub)region "
> -                              "alignment of %" PRIu32 " bits. Minimum is %d\n",
> -                              n, rsize, TARGET_PAGE_BITS);
> +                              "DRSR[%d]: No support for MPU (sub)region size of"
> +                              " %" PRIu32 " bytes. Minimum is %d.\n",
> +                              n, (1 << rsize), TARGET_PAGE_SIZE);
>                  continue;
>              }
>              if (srdis) {
> 
