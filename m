Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp298207lfi;
        Thu, 2 Apr 2020 23:51:09 -0700 (PDT)
X-Google-Smtp-Source: APiQypIX0Dmk8RAn3be32YWCIGWHLaqDgB3EeMyuX3tt6DC1lwkZfKw3EaQkyirVAH2JOPxyRQMF
X-Received: by 2002:ac8:5691:: with SMTP id h17mr1373865qta.41.1585896669627;
        Thu, 02 Apr 2020 23:51:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1585896669; cv=none;
        d=google.com; s=arc-20160816;
        b=XrA54iWExLOW2SHVUPJ8kWs0UfSDZjI24LOLdv152sOLHBsBT1Cd9B/Sy61ax5eFaJ
         n+tH6VmAbwLS8PCmFDpvnES4KG6MW3ARPGXMAGkaU8F4okgikHzxNa11J37PFcOKydjm
         OGlgZLSU8JJiLk6y28UIrgyzZZoy2se+Kg0xgzWf1NTFo2j8vREodgBa+NQ9snvVyN16
         VE4E0x2JLg8TWFnVtfd8/btKpsk9E6vlexaVnCe8G1E7FrKWgy+HidJ9dPaDXwwD/Xwq
         ALEB+maEpyc5EW3/6HJmdiR5C/5ywNBBSmkAtx19PVVOuKcML49uF2vKdfvKD8nV9UsW
         T05w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:subject:to
         :from:date:dkim-signature;
        bh=yLdT00684KJUSDO0Ka5n997iw+/r9dVgmC8MMOSAGh8=;
        b=XDdmFSHuzpkmbT/ZP+IvWGg6EUFVIYTGipywS9KovL8aivLqRm9hXXRqJwDEEJUrGc
         KaZYKALd7lTdXREwP5+JwrPQ789zao/m5vPkEybJcb+VR00/27pWTF8xuoWTYAnRe2vy
         N2gCYtAbA/dWfyyux2shXIyxonmOl63y8aH7z4/04/HXMHlzYHNTgi1700GhguaQXQRX
         qMMx+CtQWYO3UcS/GLJ8T/j7YyWDb6cvVd2eLo9i/Dpotfko3ffZaOGmE6IDdDesBE+v
         fUN66EV3DEvHEPy4xtfIxoMIag/I4b0VD/YXziILlBN+TBMW4KVgnDnxWO3/A/9YH/Z1
         vYxw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=iPg11pz7;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g23si2388942qta.261.2020.04.02.23.51.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Apr 2020 23:51:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=iPg11pz7;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:50940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jKGAX-0002ud-0B
	for alex.bennee@linaro.org; Fri, 03 Apr 2020 02:51:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34195)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <frasse.iglesias@gmail.com>) id 1jKG9R-0001IU-DZ
 for qemu-devel@nongnu.org; Fri, 03 Apr 2020 02:50:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <frasse.iglesias@gmail.com>) id 1jKG9Q-0002Gs-Gi
 for qemu-devel@nongnu.org; Fri, 03 Apr 2020 02:50:01 -0400
Received: from mail-lf1-x142.google.com ([2a00:1450:4864:20::142]:32803)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <frasse.iglesias@gmail.com>)
 id 1jKG9Q-0002GM-9p; Fri, 03 Apr 2020 02:50:00 -0400
Received: by mail-lf1-x142.google.com with SMTP id h6so352423lfc.0;
 Thu, 02 Apr 2020 23:50:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=yLdT00684KJUSDO0Ka5n997iw+/r9dVgmC8MMOSAGh8=;
 b=iPg11pz7R7Jxwk6+gexmS39zkf0f+m07ttWNvD3BTngyp/E1OexwGqF1NKKIbnLe+w
 hKyqkYQcyM3BlS/hxU9Fh109rdCHbItnz97tzq1S7BfK0pI6uVoIdZiIAlqYXqhONM2B
 P1bXZjGxHwUN/7HoaPDtyfSZVzB5TbyWm++6LdIr4SytAPmnul/xuHbDh9VdNSBoRvVB
 2LLLs84NuZ68k7FF085ZmVvRosPvJMSlq0ltUbwP1yn9lE3i/Tx8HYH/kvrSoAFxR0a5
 8OpqB6+1OHrKDvBW5A1Fk7pzNM298OEjBNtffVrP6eb4Ccze/wqbNnECB1FXuae4KAFn
 5PYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=yLdT00684KJUSDO0Ka5n997iw+/r9dVgmC8MMOSAGh8=;
 b=l90PL5eDxeqFxk0yjY+yA9EMcm7Yli/R1sMUIMp66H1TnKDB1/o6uZ3RFwq+nKkyU7
 psjA82X0Z+HQT0ksgeVa4Ti/FJcIybc2czkt3l5EC9eUwpZBiQwzDXPeUpx775hJSnUN
 m/qV1tMBKJYA7A4/Zs3d3QOr8qiAK8owc9JbtvOunNdaYj55BDg5KAUXolM0MYca47Ow
 iady+9L/QqrnxdeC4FVpB4/GUbDPLMpTR+yK37zagYxnrBJ/cnxda0UJ7JxWXrB6dtqT
 IRTUnuopyQrKDbuvuYf8vSfZlbZy9qBFz29sNgbncljdqV48EcmyzZdYmpK8CWA3aeHQ
 BpEw==
X-Gm-Message-State: AGi0PuYGHtVqKS2AAVxG0l2fgci01TF2qepEsiogcvZ/NuCo67ZdbwC4
 7D6QicvUsYJVMYWdYe70ftM=
X-Received: by 2002:a05:6512:3236:: with SMTP id
 f22mr1455882lfe.120.1585896599079; 
 Thu, 02 Apr 2020 23:49:59 -0700 (PDT)
Received: from fralle-msi (31-208-27-151.cust.bredband2.com. [31.208.27.151])
 by smtp.gmail.com with ESMTPSA id
 h23sm2701512ljg.13.2020.04.02.23.49.58
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 02 Apr 2020 23:49:58 -0700 (PDT)
Date: Fri, 3 Apr 2020 08:49:56 +0200
From: Francisco Iglesias <frasse.iglesias@gmail.com>
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Subject: Re: [PATCH v1 4/5] dma/xlnx-zdma: Advance the descriptor address
 when stopping
Message-ID: <20200403064956.w7ihxsmjuixf7xvd@fralle-msi>
References: <20200402134721.27863-1-edgar.iglesias@gmail.com>
 <20200402134721.27863-5-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200402134721.27863-5-edgar.iglesias@gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::142
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: figlesia@xilinx.com, peter.maydell@linaro.org, sstabellini@kernel.org,
 edgar.iglesias@xilinx.com, sai.pavan.boddu@xilinx.com, alistair@alistair23.me,
 richard.henderson@linaro.org, qemu-devel@nongnu.org,
 frederic.konrad@adacore.com, qemu-arm@nongnu.org, philmd@redhat.com,
 luc.michel@greensocs.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HeoqJidtGWiD

On [2020 Apr 02] Thu 15:47:20, Edgar E. Iglesias wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
> 
> Advance the descriptor address when stopping the channel.
> 
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>

Reviewed-by: Francisco Iglesias <frasse.iglesias@gmail.com>

> ---
>  hw/dma/xlnx-zdma.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/hw/dma/xlnx-zdma.c b/hw/dma/xlnx-zdma.c
> index dd893bc420..e856d233f2 100644
> --- a/hw/dma/xlnx-zdma.c
> +++ b/hw/dma/xlnx-zdma.c
> @@ -514,7 +514,6 @@ static void zdma_process_descr(XlnxZDMA *s)
>      if (ptype == PT_REG || src_cmd == CMD_STOP) {
>          ARRAY_FIELD_DP32(s->regs, ZDMA_CH_CTRL2, EN, 0);
>          zdma_set_state(s, DISABLED);
> -        return;
>      }
>  
>      if (src_cmd == CMD_HALT) {
> -- 
> 2.20.1
> 
