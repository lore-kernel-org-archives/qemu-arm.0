Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp562658lfb;
        Mon, 4 May 2020 08:36:48 -0700 (PDT)
X-Google-Smtp-Source: APiQypJW8bQcvCiCc0SmqZB5qfrtuZAtHekUHOXA9IolNQtJtWzygqqt0d/BFajBTls+B8jaIhdL
X-Received: by 2002:ac8:70c:: with SMTP id g12mr17138163qth.71.1588606607900;
        Mon, 04 May 2020 08:36:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588606607; cv=none;
        d=google.com; s=arc-20160816;
        b=UThBJbohPUxj+EGdtXfYs+WiatVg3mh88Qn7kYWcaEJS38HaYfoYOwtBprvLGo4FRv
         l9cnLGLTFRpegWjS/CKn4eq8oQwVqYlY04DFlMDw8FQ7Z3Tu+jY2yBEuv5r+5SuLWhje
         FkAQu8xhqNJpHPG0QH+tNZqtIq/++Wz6YRAT/rHjuEk+/h0QlU+S3vERrXkzQsexqQiL
         dY13YJj8fPiaIQiYptjmG4hq6wslx80c0/rD6lqedvjkSrv+ilVTZ0q831XmuAavcj73
         CWTzQCRkgSA0gO+NGCk3SLbI4s9u6MryfFQHy2c9fQlPCq+sy8rIPX08k9qVES6b6+Yf
         /FQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:subject:to
         :from:date:dkim-signature;
        bh=ojavqBXblf7fKrXnNKcpDk7EqNGDDcbSQ1I4ORE7Rxg=;
        b=C//OOuAC19BQyM1bf1XgsChVJf72Lic7T9Q+XjGSJBiXlpjKbXP+BJxUWOd2p63qYz
         Rft1LRfh9nPGNzoEh0vWEza3rfNKT8Eh6ExkM3ZOtPL4bH7Gu2EJSkXC/J1g8Ci3Bk2y
         pqFwGxog4qsZINXJxfo9snLoBKJKIgVyA5kvSuNIWRUznxrhp6TVOW16xfCe15CT+Duf
         bGUBoJA2R8/H6z818gUFexKMs4AtkEGP0V3bc9VxSQ+YisfNimiMdUz+X2MuJAJp8683
         hJxkLkNiqXjwJF2s23YW/aK4CKpe74Sb2fgxSvDx6uCQAunec2E2z9XbXJ/oW9Ui7b9w
         CnVA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=YXP1yKmX;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:470:142::17])
        by mx.google.com with ESMTPS id h4si6535370qta.69.2020.05.04.08.36.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 May 2020 08:36:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) client-ip=2001:470:142::17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=YXP1yKmX;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:52110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jVd9D-00069t-7M
	for alex.bennee@linaro.org; Mon, 04 May 2020 11:36:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frasse.iglesias@gmail.com>)
 id 1jVd2X-0004Op-Bs; Mon, 04 May 2020 11:29:53 -0400
Received: from mail-lf1-x143.google.com ([2a00:1450:4864:20::143]:33244)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frasse.iglesias@gmail.com>)
 id 1jVd2V-0003xa-Li; Mon, 04 May 2020 11:29:53 -0400
Received: by mail-lf1-x143.google.com with SMTP id z22so9962559lfd.0;
 Mon, 04 May 2020 08:29:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=ojavqBXblf7fKrXnNKcpDk7EqNGDDcbSQ1I4ORE7Rxg=;
 b=YXP1yKmXJ9HAEGgOroaeAxKOFKg7E/aneQefvOwFkUqueylD2TmoDfuneZkkgr8NuK
 fZGdAW1iSmYM0BAhKl1KULBPJ4+bZBya3fog8Zk0y3CFKOaeq1nPRsdK/V0KhFkkq6JZ
 RcUncouh4snFNhlgdKZVEuhrw7bBwjoX/xmcxLO0rWHBPkoCRwf801USKPGcY/xw2yFf
 qg0CWP9z5ej0TT/Xg2vxqrQX8TV6V0YeJhOOxakz1sBzWvu50orbDMtaR+49JCvuEPQl
 fcMJAwk3b2Awz3Q2y0LVbQYneR9OrJIQZh8vQK0AS5lAJsALbaJM2WuYliL0Y/sj1yZO
 0JJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ojavqBXblf7fKrXnNKcpDk7EqNGDDcbSQ1I4ORE7Rxg=;
 b=o5rr7miXVvG3pa/wrhWXXbylmLHsWG7KgVt9OC9aiU99HbkWER1EEOQXs6s8OoIuO0
 aRkGZx4eHE1s/cFLVUPF4d/tE9YZOLqnBIeelcTrx5OM2f9w8DjNsaTBceqCFAr8X1x8
 +rcMYDpeqd11CyIlniwdKsJ8DY9Au2djyHc4gFubK/MH+4UUppPvFvVpsiMedWv2vsER
 pFz0VPeZuuNcU8VAgq4E199UsDMLYgP56MS/avPUcLYOPzQByER3z+KxVzqVJXlju0Bc
 nrVEcYGDzmaIU6E2IFhJ4hmj4EpEli1mJrolN44bEtAr8VDRVBBeI2uxPLb8Bwjb8Y6t
 PBqQ==
X-Gm-Message-State: AGi0PuaQaPp4vCdO6gQo6C0+ACyRT+7ly5X93ZENdkfNE5W1B+T99sRu
 2ysUNG3IFtXwj5pTPANb0rE=
X-Received: by 2002:a19:ad45:: with SMTP id s5mr12240629lfd.106.1588606188382; 
 Mon, 04 May 2020 08:29:48 -0700 (PDT)
Received: from fralle-msi (31-208-27-151.cust.bredband2.com. [31.208.27.151])
 by smtp.gmail.com with ESMTPSA id
 r1sm8421185ljg.50.2020.05.04.08.29.47
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 04 May 2020 08:29:47 -0700 (PDT)
Date: Mon, 4 May 2020 17:29:45 +0200
From: Francisco Iglesias <frasse.iglesias@gmail.com>
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Subject: Re: [PATCH v1 2/9] hw/net/xilinx_axienet: Cleanup stream->push
 assignment
Message-ID: <20200504152944.55ytilywjtx3zg33@fralle-msi>
References: <20200430162439.2659-1-edgar.iglesias@gmail.com>
 <20200430162439.2659-3-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200430162439.2659-3-edgar.iglesias@gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Received-SPF: pass client-ip=2a00:1450:4864:20::143;
 envelope-from=frasse.iglesias@gmail.com; helo=mail-lf1-x143.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -1020
X-Spam_score: -102.1
X-Spam_bar: ---------------------------------------------------
X-Spam_report: (-102.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001, URIBL_BLOCKED=0.001,
 USER_IN_WHITELIST=-100 autolearn=_AUTOLEARN
X-Spam_action: no action
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
Cc: damien.hedde@greensocs.com, peter.maydell@linaro.org,
 sstabellini@kernel.org, edgar.iglesias@xilinx.com, sai.pavan.boddu@xilinx.com,
 jasowang@redhat.com, alistair@alistair23.me, qemu-devel@nongnu.org,
 frederic.konrad@adacore.com, qemu-arm@nongnu.org, philmd@redhat.com,
 luc.michel@greensocs.com, figlesia@xilinx.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cdo3YD1xQ3nv

On [2020 Apr 30] Thu 18:24:32, Edgar E. Iglesias wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
> 
> Split the shared stream_class_init function to assign
> stream->push with better type-safety.
> 
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>

Reviewed-by: Francisco Iglesias <frasse.iglesias@gmail.com>

> ---
>  hw/net/xilinx_axienet.c | 18 ++++++++++++------
>  1 file changed, 12 insertions(+), 6 deletions(-)
> 
> diff --git a/hw/net/xilinx_axienet.c b/hw/net/xilinx_axienet.c
> index 0f97510d8a..84073753d7 100644
> --- a/hw/net/xilinx_axienet.c
> +++ b/hw/net/xilinx_axienet.c
> @@ -1029,11 +1029,19 @@ static void xilinx_enet_class_init(ObjectClass *klass, void *data)
>      dc->reset = xilinx_axienet_reset;
>  }
>  
> -static void xilinx_enet_stream_class_init(ObjectClass *klass, void *data)
> +static void xilinx_enet_control_stream_class_init(ObjectClass *klass,
> +                                                  void *data)
>  {
>      StreamSlaveClass *ssc = STREAM_SLAVE_CLASS(klass);
>  
> -    ssc->push = data;
> +    ssc->push = xilinx_axienet_control_stream_push;
> +}
> +
> +static void xilinx_enet_data_stream_class_init(ObjectClass *klass, void *data)
> +{
> +    StreamSlaveClass *ssc = STREAM_SLAVE_CLASS(klass);
> +
> +    ssc->push = xilinx_axienet_data_stream_push;
>  }
>  
>  static const TypeInfo xilinx_enet_info = {
> @@ -1048,8 +1056,7 @@ static const TypeInfo xilinx_enet_data_stream_info = {
>      .name          = TYPE_XILINX_AXI_ENET_DATA_STREAM,
>      .parent        = TYPE_OBJECT,
>      .instance_size = sizeof(struct XilinxAXIEnetStreamSlave),
> -    .class_init    = xilinx_enet_stream_class_init,
> -    .class_data    = xilinx_axienet_data_stream_push,
> +    .class_init    = xilinx_enet_data_stream_class_init,
>      .interfaces = (InterfaceInfo[]) {
>              { TYPE_STREAM_SLAVE },
>              { }
> @@ -1060,8 +1067,7 @@ static const TypeInfo xilinx_enet_control_stream_info = {
>      .name          = TYPE_XILINX_AXI_ENET_CONTROL_STREAM,
>      .parent        = TYPE_OBJECT,
>      .instance_size = sizeof(struct XilinxAXIEnetStreamSlave),
> -    .class_init    = xilinx_enet_stream_class_init,
> -    .class_data    = xilinx_axienet_control_stream_push,
> +    .class_init    = xilinx_enet_control_stream_class_init,
>      .interfaces = (InterfaceInfo[]) {
>              { TYPE_STREAM_SLAVE },
>              { }
> -- 
> 2.20.1
> 
