Received: by 10.223.197.9 with SMTP id q9csp1695224wrf;
        Fri, 6 Oct 2017 07:12:49 -0700 (PDT)
X-Received: by 10.200.19.75 with SMTP id f11mr3123315qtj.321.1507299169273;
        Fri, 06 Oct 2017 07:12:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1507299169; cv=none;
        d=google.com; s=arc-20160816;
        b=H/SDj9z9SAmQW8eYAllaPRzdBRmcgtXhjIlEbGcmpW3IE744ueJPEf7yA86EG54bJU
         Sim1l8IZS9KcRIABhPwaDLopaPOs/yCCFhH1RRJRlfbKvE05W/0NnFmh+5xs/FYU+/rS
         6+gmEeayZEZyP65Yh1Qaeb+3MZHLyokXTEaaIC7bdhxtSjUcvK3tXIXIdkEi55CmcLm1
         WQ9tJTQtBmqT18OFN7Az7TUJ0PPCkHK/yGiZ8/adVCtaJD7Vjq18M1ZWMevrx1/yjcWu
         GvqRc6XnWDlYjATjFKyqldleheufwPJo4co61jbmqz7gtZrfwyHLcm6uiMqUMOHRcEzg
         gR/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=sJyK8Un3ym7m0bNJsHJND3wXUTprkXvw5JieK/cVPDM=;
        b=zeFsEPChi8f2ABG3llSyy1AdRveeUVM8Fy69LlXeJtUNLW6uJW0IyZTAQ6mvvKF2t+
         XfO6Afu0BJ1ZhE8qb5evQvzTR98FN9ylGIoCcc3KPQQxnrko3um/qnMHOltXPTdcs0E2
         HT8htR4tmp8tMz4rmgN+RX6mwJURy674bPTAXpSKAqyeQEvcHbRLCUBVppD+3ZSw4d5T
         T9RVWzrLCbDmjASiy9MIbEhOWJt6qYwHFb1C8DE5pDhuLTv4k8tCoFxOIATNSX2EoptL
         rQLwcOctfrD23UiJb7uXq1ne6jBg+3otdLaTWvFkc8Oc9pqM9YLST2o/VI5LNt/7j5He
         DGhg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=SuFoCZ2M;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m39si901323qkh.312.2017.10.06.07.12.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 06 Oct 2017 07:12:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=SuFoCZ2M;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45185 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e0TMu-0003O8-Nb
	for alex.bennee@linaro.org; Fri, 06 Oct 2017 10:12:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50645)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e0TMi-0003M3-D1
	for qemu-arm@nongnu.org; Fri, 06 Oct 2017 10:12:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e0TMh-0004QX-I8
	for qemu-arm@nongnu.org; Fri, 06 Oct 2017 10:12:36 -0400
Received: from mail-wr0-x22f.google.com ([2a00:1450:400c:c0c::22f]:47141)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1e0TMh-0004Pg-Bc
	for qemu-arm@nongnu.org; Fri, 06 Oct 2017 10:12:35 -0400
Received: by mail-wr0-x22f.google.com with SMTP id y44so7807107wrd.4
	for <qemu-arm@nongnu.org>; Fri, 06 Oct 2017 07:12:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=sJyK8Un3ym7m0bNJsHJND3wXUTprkXvw5JieK/cVPDM=;
	b=SuFoCZ2MRfJEZxTAIULj6YNR8ostjc7waslkyR3tVwHTSh0JZFJPxdGfRveZBabSM9
	bEwz3G1GcEz3y8ImH8NOTtG0e3bWxt0L9bkRjX5bXhsp0Gvag0i4UDtLWcQuosALSk4I
	Ze32c4vYHx+9yVIpCYV9eaO2eFqpz3aDVnxto=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=sJyK8Un3ym7m0bNJsHJND3wXUTprkXvw5JieK/cVPDM=;
	b=gKNsnmZLzBg59rsocVeDDMHrvVpuRR8CrtrsMVZVIq95o8CAMHsYnSOw3fiJd/j/AQ
	817W4oESAeURslE2rfpCNtDG0hyy+KgRvD++3JYV00/VYy1k/IbKsNfQAvw98HzWNP5y
	FSRR09ZQV0r2+1uDEeE6SpeG2KBwFJ9LwrUTJ7BFi+gIE290RB/sinVTClyThgm5s7Vc
	GoFuoP001yDOd/O7xP4Dpo1VGdjVL16cHbuEW90bKQcOFyYbyPQILvcicif4AtdKMDwV
	gl4FB/G2ziDEUbTd9Pf1Q3eQLty9tpfwZI3CXcDn/Zlz6R06IK/1Jvco84Dd7DXemCmJ
	3gPQ==
X-Gm-Message-State: AMCzsaX5EDc8mLa4AwDjlSpxpBcj65tCLppne3me9JDIPm3ly/7+NEDx
	ZhQk6z0c6IdSpdXob2NJM4tylslJ/UnT/rSn0JYb7w==
X-Google-Smtp-Source: AOwi7QDL/LSIX9DZDqaRT8EMvMr/gxLYJlOx7twoeQGFBSLYqqNQ9hMUgNguI+sefh4SsAb7rdcPzVpkwkdYyjj9XfI=
X-Received: by 10.223.197.13 with SMTP id q13mr2432310wrf.272.1507299154427;
	Fri, 06 Oct 2017 07:12:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.128.207 with HTTP; Fri, 6 Oct 2017 07:12:13 -0700 (PDT)
In-Reply-To: <20170918195100.17593-10-andrew.smirnov@gmail.com>
References: <20170918195100.17593-1-andrew.smirnov@gmail.com>
	<20170918195100.17593-10-andrew.smirnov@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 6 Oct 2017 15:12:13 +0100
Message-ID: <CAFEAcA9CZCLzUfZyNLbUF7tkDW+2HWNKk2+MLvx109VgoXNrEw@mail.gmail.com>
To: Andrey Smirnov <andrew.smirnov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::22f
Subject: Re: [Qemu-arm] [PATCH 09/17] imx_fec: Use correct length for packet
 size
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Jason Wang <jasowang@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Andrey Yurovsky <yurovsky@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: agjqJQs6yYl1

On 18 September 2017 at 20:50, Andrey Smirnov <andrew.smirnov@gmail.com> wrote:
> Use 'frame_size' instead of 'len' when calling qemu_send_packet(),
> failing to do so results in malformed packets send in case when that
> packed is fragmented into multiple DMA transactions.
>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: Jason Wang <jasowang@redhat.com>
> Cc: qemu-devel@nongnu.org
> Cc: qemu-arm@nongnu.org
> Cc: yurovsky@gmail.com
> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
> ---
>  hw/net/imx_fec.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/net/imx_fec.c b/hw/net/imx_fec.c
> index 6045ffe673..c45b9648d9 100644
> --- a/hw/net/imx_fec.c
> +++ b/hw/net/imx_fec.c
> @@ -532,7 +532,7 @@ static void imx_enet_do_tx(IMXFECState *s, uint32_t index)
>                  }
>              }
>              /* Last buffer in frame.  */
> -            qemu_send_packet(qemu_get_queue(s->nic), frame, len);
> +            qemu_send_packet(qemu_get_queue(s->nic), frame, frame_size);
>              ptr = frame;
>              frame_size = 0;
>              if (bd.option & ENET_BD_TX_INT) {

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
