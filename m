Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp2871049njc;
        Tue, 5 Nov 2024 06:47:54 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXHgoKt1gCCe6F7Kyjk/oNkjvaK1QEifkacNJ1AjZbdN01J5zN6CGi/jEz0+R4n+mXlYOWcerVoF5NCmw==@linaro.org
X-Google-Smtp-Source: AGHT+IGziwaNZ6zOpVXi5gv0kfp+Hh9QCpZJwO2S/jjfe3M9pMoOW4sJPngk4+lobEYUSGteBLQy
X-Received: by 2002:a05:620a:1a89:b0:7b1:543d:c9f with SMTP id af79cd13be357-7b193f7001amr5171941285a.62.1730818073996;
        Tue, 05 Nov 2024 06:47:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1730818073; cv=none;
        d=google.com; s=arc-20240605;
        b=jVcpf/wWUhewuMHDhLGdrtFhOd1XQ8yc/bdWmd/KNA4vDcWAlycGDMeed6tor3pztW
         +YP6/VB4+HbSxDjME9ithwf3X76gEwJ0SNhkSpPcz/DFQ2cDFGR5EpPM8yw5b5BcW91O
         HE91TEvdoLxuOcdPXzvg2tV4imCk2JzTxhFzVvsY76d5wmFzQkvMhNeQS/QAT1pMzX2X
         O3/AJP4WX3Z3rHmEmNwbO4yx98LBiXs2VOYliShXQjNEVfEgQ0i6QoNNuyYGeOkDjaNt
         uCnMJJfiJ06uITDAs/FisHYHxlrDRi9DbZiN7vRxLBgA538jn1e5Qinj0Z60cwB2tCjd
         bwgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:subject:cc:to:date:dkim-signature;
        bh=U5YZdqD8QyYx1ch54gkcBc1ouMYgGKnfbdkVYC7H6Jw=;
        fh=vDt2tAnSauL46jd9IHShjTjOSYwG1bOsam4bHq/qpFQ=;
        b=jc4qyNGqb4/bFNMz4A9U/sSwty3XtcO4RlWBaojhpIcEL467p/OU++Q4ijx6D407GD
         9he+PN14xDr+t9jgh6wCY/VD66Pwnwap6lAWN34B9YuSJFoyl98V+iLaiotqie9WBD9x
         /dR2RftKWXWlVqOsPAw/nfmk2S9EKZ6oXrOBhsWNCSjqwgGVZS4jBbmclFZcXAP4Xd8T
         nreaJ0wEQW34rQshfYEIKzCgyHGntXpNpu9eZhQdKEvAnc4l/UJ/1ZHK9Dt7GRqCHR9D
         NrHxIj6heZv0fNNkw+t1Ti6cxua5xSw41Bx2qM79zL56wdgHwhWgrndlySwQFwobQvQ4
         A7WQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@rev.ng header.s=dkim header.b="sV/Ex827";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b2f3a8337csi1309319285a.279.2024.11.05.06.47.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Nov 2024 06:47:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@rev.ng header.s=dkim header.b="sV/Ex827";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t8KqK-0005cy-J3; Tue, 05 Nov 2024 09:47:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>)
 id 1t8KqI-0005cU-8F; Tue, 05 Nov 2024 09:47:38 -0500
Received: from rev.ng ([94.130.142.21])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>)
 id 1t8KqG-0007dw-D3; Tue, 05 Nov 2024 09:47:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
 s=dkim; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive:List-Unsubscribe:List-Unsubscribe-Post:
 List-Help; bh=U5YZdqD8QyYx1ch54gkcBc1ouMYgGKnfbdkVYC7H6Jw=; b=sV/Ex827+K/xrv0
 vmatvk0ciyw5UQC1Bmdw5+1bfPyDYOoN6bEg/hF6oQ/6ej2SXfQ+/+3/iFdUu5ilDhspl8f6micRr
 ap/+YkvDaS6R6PG8qkdqPXWuHqL4cBFHdLimM2i/l6lXA9noGld4glHhR0zYt/tsJd54WO7lc1ke7
 WA=;
Date: Tue, 5 Nov 2024 15:50:15 +0100
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
 Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>, 
 Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org, devel@lists.libvirt.org, 
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 07/19] hw/microblaze: Restrict MemoryRegionOps are
 implemented as 32-bit
Message-ID: <ap7vjnwtzqvmkrjdfdp5tfkbskls7a2rh7jgez3w4n3paworrh@pg3totp623ug>
References: <20241105130431.22564-1-philmd@linaro.org>
 <20241105130431.22564-8-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241105130431.22564-8-philmd@linaro.org>
Received-SPF: pass client-ip=94.130.142.21; envelope-from=anjo@rev.ng;
 helo=rev.ng
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-to:  Anton Johansson <anjo@rev.ng>
From:  Anton Johansson via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: BiDveT5IXHIn

On 05/11/24, Philippe Mathieu-Daudé wrote:
> All these MemoryRegionOps read() and write() handlers are
> implemented expecting 32-bit accesses. Clarify that setting
> .impl.min/max_access_size fields.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>  hw/char/xilinx_uartlite.c | 4 ++++
>  hw/intc/xilinx_intc.c     | 4 ++++
>  hw/net/xilinx_ethlite.c   | 4 ++++
>  hw/timer/xilinx_timer.c   | 4 ++++
>  4 files changed, 16 insertions(+)

Reviewed-by: Anton Johansson <anjo@rev.ng>
