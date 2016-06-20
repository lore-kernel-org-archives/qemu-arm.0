Received: by 10.25.21.96 with SMTP id l93csp1374865lfi;
        Mon, 20 Jun 2016 03:24:58 -0700 (PDT)
X-Received: by 10.55.27.98 with SMTP id b95mr20576549qkb.65.1466418298414;
        Mon, 20 Jun 2016 03:24:58 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q190si19347664qke.136.2016.06.20.03.24.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 20 Jun 2016 03:24:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42499 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bEwO1-0006TC-Ua
	for alex.bennee@linaro.org; Mon, 20 Jun 2016 06:24:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45280)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sergey.fedorov@linaro.org>) id 1bEwLh-0005If-Gz
	for qemu-devel@nongnu.org; Mon, 20 Jun 2016 06:22:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sergey.fedorov@linaro.org>) id 1bEwLd-0002LO-E2
	for qemu-devel@nongnu.org; Mon, 20 Jun 2016 06:22:33 -0400
Received: from mail-lf0-x234.google.com ([2a00:1450:4010:c07::234]:33463)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sergey.fedorov@linaro.org>) id 1bEwLc-0002LD-Q9
	for qemu-devel@nongnu.org; Mon, 20 Jun 2016 06:22:29 -0400
Received: by mail-lf0-x234.google.com with SMTP id f6so34647597lfg.0
	for <qemu-devel@nongnu.org>; Mon, 20 Jun 2016 03:22:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=Cf3vZKh2lUV1CrmsvmSRMyjIeqUwmXTVcmFEN/A2HpY=;
	b=GPgfX4RsqoURLI9wCh99set7yTaZ+5NECfWKFvvzVc2R569ovomt05+d+TuLbHLrjO
	O1KER5sQ8jqDcUiXgfLggYttSoFQMu8Sc4zpwmd43jWn7UPLay8azVjH5uvEJa/IPqpA
	prSgi3jUxSF2A5jtB76ozcqVrIGtTeS1Ek89A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=Cf3vZKh2lUV1CrmsvmSRMyjIeqUwmXTVcmFEN/A2HpY=;
	b=FnAapS3MxKsEslOr18DUpHfVRhuN2wkB9jBz8y/CX3aD4oAKJageIf1k3UPbaPBdsQ
	lhkb52ICKR1QFG9g06YyMCmqXtlA440zb3WexoY4bjr0hglmitzIHAr3PhJEGP+4ETec
	yeQu56aIseOWpvNjJYoYlQLe3gXtabE9xWfvc9gAM9XUXzgxMXqYN0GEop9+Cy3DqZ62
	FoE03m0tQoMU5y6lU7QEvmb3lWkmojyZUVk2oyypN7YlE2WHy3n7Bx5sGwQd5lYZ1/xM
	sAwyJ6XxwsNzx1Tun7l8ENBJtrzcH+x0twkTy+/CRoCtPfqsc5l6grUq8Cub4XCllMs7
	UTwA==
X-Gm-Message-State: ALyK8tKloMQ2MNihhiFE+/Jm4jZgZNFY1UpIO5qDEn0wd9VG9Ql9WlYlW70NLyurjm6VeOgz
X-Received: by 10.25.31.9 with SMTP id f9mr4342837lff.127.1466418147853;
	Mon, 20 Jun 2016 03:22:27 -0700 (PDT)
Received: from [192.168.0.65] (broadband-46-188-121-115.2com.net.
	[46.188.121.115]) by smtp.gmail.com with ESMTPSA id
	u19sm3470085lja.12.2016.06.20.03.22.26
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 20 Jun 2016 03:22:26 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1466416634-9798-1-git-send-email-peter.maydell@linaro.org>
From: Sergey Fedorov <sergey.fedorov@linaro.org>
Message-ID: <5767C3E2.6010604@linaro.org>
Date: Mon, 20 Jun 2016 13:22:26 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.8.0
MIME-Version: 1.0
In-Reply-To: <1466416634-9798-1-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c07::234
Subject: Re: [Qemu-devel] [PATCH] hw/intc/arm_gicv3: Fix compilation with
 simple trace backend
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
X-TUID: MN3MVpAiE2Ko

On 20/06/16 12:57, Peter Maydell wrote:
> Fix missing includes of qemu/log.h, which broke compilation with the
> simple trace backend (the default backend pulls in log.h implicitly
> via trace.h).
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Tested-by: Sergey Fedorov <sergey.fedorov@linaro.org>
Reviewed-by: Sergey Fedorov <sergey.fedorov@linaro.org>

Thanks,
Sergey

> ---
> In particular, this broke travis builds.
> ---
>  hw/intc/arm_gicv3_dist.c   | 1 +
>  hw/intc/arm_gicv3_redist.c | 1 +
>  2 files changed, 2 insertions(+)
>
> diff --git a/hw/intc/arm_gicv3_dist.c b/hw/intc/arm_gicv3_dist.c
> index b977ae5..3ea3dd0 100644
> --- a/hw/intc/arm_gicv3_dist.c
> +++ b/hw/intc/arm_gicv3_dist.c
> @@ -10,6 +10,7 @@
>   */
>  
>  #include "qemu/osdep.h"
> +#include "qemu/log.h"
>  #include "trace.h"
>  #include "gicv3_internal.h"
>  
> diff --git a/hw/intc/arm_gicv3_redist.c b/hw/intc/arm_gicv3_redist.c
> index 55c25e8..2f60096 100644
> --- a/hw/intc/arm_gicv3_redist.c
> +++ b/hw/intc/arm_gicv3_redist.c
> @@ -10,6 +10,7 @@
>   */
>  
>  #include "qemu/osdep.h"
> +#include "qemu/log.h"
>  #include "trace.h"
>  #include "gicv3_internal.h"
>  

