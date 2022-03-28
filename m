Received: by 2002:a05:6512:e9d:0:0:0:0 with SMTP id bi29csp6349389lfb;
        Mon, 28 Mar 2022 02:00:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw1rf1cWIhY/Wxt2TIrL6Kum8zRAuWzLavKqTmAOn8Cyi9CGKfDS1EO37SeAb+aN3lM70R0
X-Received: by 2002:ac8:5984:0:b0:2e1:e812:f42 with SMTP id e4-20020ac85984000000b002e1e8120f42mr20209837qte.609.1648458024635;
        Mon, 28 Mar 2022 02:00:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1648458024; cv=none;
        d=google.com; s=arc-20160816;
        b=YV/mWe1B6FdoKpsAm8r/YJPIsW8GuwUMODzpYkTkbNdXAWStSoxVvEwoj7cqXiLdt6
         wwolcrC1ManT8M3OEIgrk8ea4gf61jN3gi+XalggdEFJojNxtRBfB7UztjAPpUu5VWoK
         QnHZ6jc1jhwu59pdgQkHMiivqQl0tXjAz7/LwHluDFGPbZncwz9yoVIPWp3uue6I1aQL
         PVi6rr3vaGfPOzb2NN2f1LZ9CpgkeNvnTGoAuZOKB8eCOVUIE7GsqNwy2sMcMIKB+QAC
         yC5tDwVAXIo8l0bsrx8NS8NNjQm1dz4YLVAf35dIcvrDhenbc57J6j+gPAyX+tVaVlPu
         +sNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:to:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=nSwJZx8UTlg4hwcQytPwG4OcL6wUmM8S1yLrQYpFbHg=;
        b=IsgwlZWCHBtjVdUAeMhhMHfI3DumDTerYssVrJYOlbKWLf01Af/9he92heZqIluX8S
         EURfUwm+l3u6QXOTmsVH+Afs9MSfZ+GPy6f8OgvjAWeD8NdUDuqQaHgnqGKR57k3HnJa
         gs75njJonVkCjyYHQCuC1Ih/Gg89+HKj7SuNp7iRCM0tQ/SVzzOr3XBTI6eCHYONOIAM
         wVFOFBDC3/uhOBcb+SaV/L0ba0nont3kg5UZxTG/vTpgSL3aPmkRfv+qgMH/Ajg7axg1
         x1ddwFOs9gouYMnx6c/WO050l3P1ykmFUPs5fIrgqC9RU4T2FtPkFrk2Z5hiLcWNOkSj
         eKOg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=CjFzgirE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w8-20020a05620a424800b0067e4be239f4si6959739qko.569.2022.03.28.02.00.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 28 Mar 2022 02:00:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=CjFzgirE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:46206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nYlEe-0001sK-2f
	for alex.bennee@linaro.org; Mon, 28 Mar 2022 05:00:24 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nYlDn-0001qJ-Tc
 for qemu-arm@nongnu.org; Mon, 28 Mar 2022 04:59:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40823)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nYlDl-0004iF-38
 for qemu-arm@nongnu.org; Mon, 28 Mar 2022 04:59:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648457968;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nSwJZx8UTlg4hwcQytPwG4OcL6wUmM8S1yLrQYpFbHg=;
 b=CjFzgirEDz5CfdKxvFRAWyQ8HGG+ZmcWRTiHiLQDtLzd0teAap7/X7MJMrkIAy5FCr6lpf
 VQfeG4G6dBr+sIRvQYaHzKEMBXwYU5v5z2RBc6HK9Mnja9G2VGROBtkOqmW+m/v/rMv/yY
 kGpZQKmYSCKehLddZZnNb53RCE1iIWk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-586-xhPUqOQ6MV6oCOszCmAA9Q-1; Mon, 28 Mar 2022 04:59:23 -0400
X-MC-Unique: xhPUqOQ6MV6oCOszCmAA9Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C96F685A5BC;
 Mon, 28 Mar 2022 08:59:22 +0000 (UTC)
Received: from [10.33.192.183] (dhcp-192-183.str.redhat.com [10.33.192.183])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D91C82166B25;
 Mon, 28 Mar 2022 08:58:57 +0000 (UTC)
Message-ID: <ae138d83-d3b6-3fc0-4279-e804126b9ed4@redhat.com>
Date: Mon, 28 Mar 2022 10:58:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH 5/5] s390x/tcg: fix format-truncation warning
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
References: <20220328084717.367993-1-marcandre.lureau@redhat.com>
 <20220328084717.367993-6-marcandre.lureau@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220328084717.367993-6-marcandre.lureau@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 David Hildenbrand <david@redhat.com>, Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Beniamino Galvani <b.galvani@gmail.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, Antony Pavlov <antonynpavlov@gmail.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fFJfJt+BDnCq

On 28/03/2022 10.47, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> ../target/s390x/tcg/translate.c: In function ‘s390x_translate_init’:
> ../target/s390x/tcg/translate.c:224:64: error: ‘%d’ directive output may be truncated writing between 1 and 11 bytes into a region of size 3 [-Werror=format-truncation=]
>    224 |         snprintf(cpu_reg_names[i], sizeof(cpu_reg_names[0]), "r%d", i);
>        |                                                                ^~
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>   target/s390x/tcg/translate.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
> index 5acfc0ff9b4e..a082342a0424 100644
> --- a/target/s390x/tcg/translate.c
> +++ b/target/s390x/tcg/translate.c
> @@ -199,7 +199,7 @@ static TCGv_i64 regs[16];
>   
>   void s390x_translate_init(void)
>   {
> -    int i;
> +    size_t i;
>   
>       psw_addr = tcg_global_mem_new_i64(cpu_env,
>                                         offsetof(CPUS390XState, psw.addr),
> @@ -221,7 +221,7 @@ void s390x_translate_init(void)
>                                      "cc_vr");
>   
>       for (i = 0; i < 16; i++) {
> -        snprintf(cpu_reg_names[i], sizeof(cpu_reg_names[0]), "r%d", i);
> +        snprintf(cpu_reg_names[i], sizeof(cpu_reg_names[0]), "r%zu", i);

The compiler is *really* too stupid to see that i is in the range between 0 
and 16 here??? ... that rather sounds like a compiler bug to me than 
something that we should work-around in the QEMU source code. Considering 
that you're using a x.0 release of GCC, please file a bug against GCC 
instead. If they refuse to fix it for GCC 12.1 or later, we can revisit this 
patch, but currently, I really think this should be fixed in GCC instead.

  Thomas

