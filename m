Received: by 10.25.227.6 with SMTP id a6csp5718848lfh;
        Fri, 30 Jun 2017 07:54:26 -0700 (PDT)
X-Received: by 10.237.62.58 with SMTP id l55mr26070935qtf.20.1498834466766;
        Fri, 30 Jun 2017 07:54:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1498834466; cv=none;
        d=google.com; s=arc-20160816;
        b=vqZoCqeZKMabZrnj+eNA/EU30kGtv6Ad/XaL2NDgrJ+hYr8s1NgFLWcK9QiKOJ+Fwz
         byO9a3SGQbfxLIaBeP3FJfeCO1vtWJcMCHfxJNwHJH5Xh9iTLOG/sfR13NsRh0Tb4Oz4
         LjENWJ64MIE0neUu+fEEZZh+yonLUShAR6lxVlmbfVhj0CZA9rDCBzp/NWtBocZTeIcZ
         KcH14LVw+V0zxNErNls4eywWUM5nwZiWmCYh8eolRfvyTkNDfkkoEex5kLPz7bj6Dylt
         NVLXbKPesIvhkO6T9DBl20hj0rem6/nE5Ug0Uyv6Me7Zrr6KGODiAnEjwEISCCMnxby/
         Wt2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to
         :arc-authentication-results;
        bh=HKeKiQeF4I0Er6+EszaNtQtrWUnSk/63UGn9Q5NpdCQ=;
        b=B9eYPyhaXQ24kfoCbMRVnLP/g1OhU1oshJXHaRPTmyzqm+ITizo+xqxQuGnFfXFRM5
         D5t2e0g26FdDDHFtNY26G9gdR3Dd8PK1HjV/wedceH9o8MgeLeY2vpNAbm6PvQWx1avu
         5Yal3577KGWD2I3rxm8fNtgUI/6vz934ALT4VTqUzV4e9/J5yPCAfa+Y+l5zJE+f8yIu
         GsKPz/neHxVl5v0PaBQ1mP/lCJ3zqhA1dTnmJq6hXf1jEr1xTMh4shShCssOpS31F6H8
         nKibvIxfJL22kNsMoQ40/nY7EfDSXpzKojO6562OYPG/ybfFpNE6MQskPvyfJj1OOL0I
         O8aQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 62si7961258qku.382.2017.06.30.07.54.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 30 Jun 2017 07:54:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:44848 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dQxJQ-0007QB-9N
	for alex.bennee@linaro.org; Fri, 30 Jun 2017 10:54:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39844)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <frederic.konrad@adacore.com>) id 1dQxIW-0006Wv-Qk
	for qemu-devel@nongnu.org; Fri, 30 Jun 2017 10:53:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <frederic.konrad@adacore.com>) id 1dQxIW-0001UQ-3Q
	for qemu-devel@nongnu.org; Fri, 30 Jun 2017 10:53:28 -0400
Received: from mel.act-europe.fr ([194.98.77.210]:60204
	helo=smtp.eu.adacore.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <frederic.konrad@adacore.com>)
	id 1dQxIR-0001Ta-NC; Fri, 30 Jun 2017 10:53:23 -0400
Received: from localhost (localhost [127.0.0.1])
	by filtered-smtp.eu.adacore.com (Postfix) with ESMTP id E7C3F815A2;
	Fri, 30 Jun 2017 16:53:21 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at eu.adacore.com
Received: from smtp.eu.adacore.com ([127.0.0.1])
	by localhost (smtp.eu.adacore.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KN-LVu80XVUR; Fri, 30 Jun 2017 16:53:21 +0200 (CEST)
Received: from [10.10.126.252] (wifi-guest-252.act-europe.fr [10.10.126.252])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128
	bits)) (No client certificate requested)
	by smtp.eu.adacore.com (Postfix) with ESMTPSA id A46908145F;
	Fri, 30 Jun 2017 16:53:21 +0200 (CEST)
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
References: <1498830944-26857-1-git-send-email-edgar.iglesias@gmail.com>
From: KONRAD Frederic <frederic.konrad@adacore.com>
Message-ID: <b6f56809-e405-5b92-83ef-485906ad382a@adacore.com>
Date: Fri, 30 Jun 2017 16:53:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1498830944-26857-1-git-send-email-edgar.iglesias@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 194.98.77.210
Subject: Re: [Qemu-devel] [PATCH v1 1/1] xilinx-dp: Add support for the yuy2
 video format
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
Cc: sai.pavan.boddu@xilinx.com, edgar.iglesias@xilinx.com, qemu-arm@nongnu.org,
	alistai@xilinx.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Js6MitYUiN2c


On 06/30/2017 03:55 PM, Edgar E. Iglesias wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
> 
> Add support for the yuy2 video format.
> 
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
> Acked-by: Sai Pavan Boddu <saipava@xilinx.com>
> ---
>   hw/display/xlnx_dp.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/hw/display/xlnx_dp.c b/hw/display/xlnx_dp.c
> index f7b7b80..a77d7db 100644
> --- a/hw/display/xlnx_dp.c
> +++ b/hw/display/xlnx_dp.c
> @@ -624,6 +624,9 @@ static void xlnx_dp_change_graphic_fmt(XlnxDPState *s)
>       case 0:
>           s->v_plane.format = PIXMAN_x8b8g8r8;
>           break;
> +    case DP_NL_VID_Y0_CB_Y1_CR:
> +        s->v_plane.format = PIXMAN_yuy2;
> +        break;
>       case DP_NL_VID_RGBA8880:
>           s->v_plane.format = PIXMAN_x8b8g8r8;
>           break;
> 

Reviewed-by: KONRAD Frederic <frederic.konrad@adacore.com>

Fred
