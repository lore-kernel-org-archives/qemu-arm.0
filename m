Received: by 2002:ac2:596f:0:0:0:0:0 with SMTP id h15csp1323442lfp;
        Mon, 18 Jul 2022 07:06:55 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sp7FDROiD+V1xrrLzj6tzpu1GD9JshRvZSIDQ8xZS8CaAtsBLupJr43mgtFEXbsXGOnBw0
X-Received: by 2002:ad4:5be8:0:b0:472:f169:de89 with SMTP id k8-20020ad45be8000000b00472f169de89mr22080007qvc.88.1658153215774;
        Mon, 18 Jul 2022 07:06:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1658153215; cv=none;
        d=google.com; s=arc-20160816;
        b=KG/elUBB6paZ8j8Su8KNLEQWHkHtjsoAF/SmMFOKkEixZ5muzUWTi8A4puoPbNA48x
         ATyb3KUkwN9dgRz6rUC0KaTEjTCBVLiTCymMun1o6ki/YjUkbtth/tstj22gN6tD/tuz
         xDhewDYW+Q+i4TSPszp12tbssNbIeRziJxLRcgnq2kDxLTcnkJFOHx/b2542bUA6Ce/d
         wpHXH2R4g+sIKRY97fI2LZLHPN6cHyyjVcSA38hCeo2CfjgdP6I7FtkBUfFNdfsdD64K
         Dc8QS4Rq0B0SdSLIgrQUhp09kSLjpOWGBYjPPbpWdkLYzRrh1Y9M+lhw9AYfArJidO00
         1GtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:dkim-signature;
        bh=Abuj6VRUhfhIoZIR3p754X/sBGrlb4yKa/V/FVLnntc=;
        b=LUprp3pP9QUJtykfpLX3nkC2v9vMR+aJzLmvbiE17J6u6/8hV0zo2bAkMoSWAQ1kwS
         rHcRXNBVnth26aLvHB68zhXCE3BvPhvFXOtwTRoafGiovOGTRoCCvwBFrbvrdhbp/2fJ
         FBCr9KUm+1ARnVoesJUiQvfc0bccCrEXy6L3VAy7JJrI+XIyHEWJy5xH5RBpzks0yw+e
         hVbxubmtuWwtFy8O85esCkYL12Pzw7RJYxLyfkyDbITw7g9K8c1onKL7T69nZDobQSSf
         03Eiuf56RHJE6LbGsi2wQRqgRd4Ek6IkDHBbK0JFp8UaNUtsJkHvqbEfddRn3U/gI11d
         /OJw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="DVyo/8E2";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i11-20020ad45c6b000000b00473bf8303a7si3891172qvh.378.2022.07.18.07.06.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Jul 2022 07:06:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="DVyo/8E2";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:43462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oDROh-0003cW-7a
	for alex.bennee@linaro.org; Mon, 18 Jul 2022 10:06:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1oDRCk-0000jw-BR
 for qemu-arm@nongnu.org; Mon, 18 Jul 2022 09:54:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56389)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1oDRCg-0002WC-P9
 for qemu-arm@nongnu.org; Mon, 18 Jul 2022 09:54:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658152469;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Abuj6VRUhfhIoZIR3p754X/sBGrlb4yKa/V/FVLnntc=;
 b=DVyo/8E2ZVYsYvQ6a8IhH8xileHZYN4cnMGwdE5MmKKy78IcgLKD+DpJ1coYtcvC2g3chz
 IfskBF7ekToKCDS0eP9lPFF20clG5LNT1KW2pnMWDvTrGy5SZ2L0fap5E40EsF1lP/jvaM
 p4tsW6yZtyBFNFkkFYRKHnTQAJXnZoM=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-549-OXjzAHMWM3Wx-P2zUhr8eQ-1; Mon, 18 Jul 2022 09:54:28 -0400
X-MC-Unique: OXjzAHMWM3Wx-P2zUhr8eQ-1
Received: by mail-ed1-f70.google.com with SMTP id
 m13-20020a056402430d00b0043ac2f27d83so8088690edc.20
 for <qemu-arm@nongnu.org>; Mon, 18 Jul 2022 06:54:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Abuj6VRUhfhIoZIR3p754X/sBGrlb4yKa/V/FVLnntc=;
 b=DOh6OL4w43qzejszmWoTDY39R9ufv9KEEW2CeRM3+DRu02IdwQjPEpUwJ4MsIbaI2L
 /C5IlBsJV+GYzU5zWSvKtGHNAJIhqV68RNKK52PbFbb6paodwqEp2JGnY2uSuUF62LTY
 HW8ADoh56O4hLSzJWGCCT+ZhzrWuX+kiMmEEJncYwk0J1Tp7JU7fg1uUNi+I93T5gNsq
 U+tfiMmVJ4OM7ixXKhhNNhl8fbKk3qKywLgW4DDW/V1MDLAN2XLEasUNJGMlGUSKFL5d
 gkLS+4OBl/gsYpImOkUCeWtmlN6nsSrcpEDfGAvD0H1SNe5xT4XfluL8/mLo84huiBF5
 o9EQ==
X-Gm-Message-State: AJIora+z5+eUi3dFjBKYVbM7sPpa2foWfEo3UtTNWmj/5NtJL40VoYWT
 pHZ9z0h2aTB5MGb+i+ocrPmrmnKXP0dINUXRWcMKxelvkd3HNoYoUaJVw1rP9eU56Tk6ER9Ry4l
 ZEyMQgNiS/MDL
X-Received: by 2002:a17:907:2855:b0:72b:700e:21eb with SMTP id
 el21-20020a170907285500b0072b700e21ebmr26007385ejc.270.1658152467544; 
 Mon, 18 Jul 2022 06:54:27 -0700 (PDT)
X-Received: by 2002:a17:907:2855:b0:72b:700e:21eb with SMTP id
 el21-20020a170907285500b0072b700e21ebmr26007349ejc.270.1658152467281; 
 Mon, 18 Jul 2022 06:54:27 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 d25-20020a170906305900b0072f42ca292bsm567820ejd.129.2022.07.18.06.54.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Jul 2022 06:54:26 -0700 (PDT)
Date: Mon, 18 Jul 2022 15:54:25 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Hesham Almatary <hesham.almatary@huawei.com>
Cc: <jonathan.cameron@huawei.com>, <qemu-devel@nongnu.org>,
 <yangyicong@huawei.com>, <chenxiang66@hisilicon.com>,
 <linuxarm@huawei.com>, <qemu-arm@nongnu.org>, <peter.maydell@linaro.org>,
 <wangyanan55@huawei.com>, <marcel.apfelbaum@gmail.com>,
 <eduardo@habkost.net>, <Brice.Goglin@inria.fr>, <mst@redhat.com>
Subject: Re: [PATCH 1/8] hmat acpi: Don't require initiator value in -numa
Message-ID: <20220718155425.6975f812@redhat.com>
In-Reply-To: <20220711104436.8363-2-hesham.almatary@huawei.com>
References: <20220711104436.8363-1-hesham.almatary@huawei.com>
 <20220711104436.8363-2-hesham.almatary@huawei.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: I4ugIx4t9K/C

On Mon, 11 Jul 2022 11:44:29 +0100
Hesham Almatary <hesham.almatary@huawei.com> wrote:

> From: Brice Goglin <Brice.Goglin@inria.fr>
> 
> The "Memory Proximity Domain Attributes" structure of the ACPI HMAT
> has a "Processor Proximity Domain Valid" flag that is currently
> always set because Qemu -numa requires an initiator=X value
> when hmat=on. Unsetting this flag allows to create more complex
> memory topologies by having multiple best initiators for a single
> memory target.
> 
> This patch allows -numa without initiator=X when hmat=on by keeping
> the default value MAX_NODES in numa_state->nodes[i].initiator.
> All places reading numa_state->nodes[i].initiator already check
> whether it's different from MAX_NODES before using it.
[...]
> 

> Signed-off-by: Brice Goglin <Brice.Goglin@inria.fr>
when re-posting patches from someone else, I think one is supposed to add
his/her own SoB at the end


> ---
>  hw/core/machine.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index a673302cce..d4d7e77401 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -1173,9 +1173,7 @@ static void numa_validate_initiator(NumaState *numa_state)
>  
>      for (i = 0; i < numa_state->num_nodes; i++) {
>          if (numa_info[i].initiator == MAX_NODES) {
> -            error_report("The initiator of NUMA node %d is missing, use "
> -                         "'-numa node,initiator' option to declare it", i);
> -            exit(1);
> +            continue;
>          }
>  
>          if (!numa_info[numa_info[i].initiator].present) {

