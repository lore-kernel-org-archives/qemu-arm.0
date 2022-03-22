Received: by 2002:a05:6512:e9d:0:0:0:0 with SMTP id bi29csp1224814lfb;
        Mon, 21 Mar 2022 20:09:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyZBV8mrGK6Jk151es0XnrX3KXxwvOEbRuGLPUh76ES794+98JFZ6CypU7mB++l5YytCX76
X-Received: by 2002:a0c:fe47:0:b0:42d:f798:3da5 with SMTP id u7-20020a0cfe47000000b0042df7983da5mr18458112qvs.77.1647918584817;
        Mon, 21 Mar 2022 20:09:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1647918584; cv=none;
        d=google.com; s=arc-20160816;
        b=NpdQH9oSTnBt8XqgYfK2EKvffMi3c4Iqtubohe14PNXmSLh8uqvrZvvFBEyKvtnnap
         eNMIoVxEX6UjGrV0UcNaz2+2rUw65SI/EXlsNx+icX6O6jXY6w1ROItlO7VQvVu2rg4J
         LJ1i3zR7LYx5QQnuHjilhfA8BIj/F+oKdged2JG6O/U0WI48wYZ4NM4EMyfh5YfZrZ9m
         vglHUhyaw1xiESwTd7wlA3sm9Qa0STryNgltaE5GhLN53N1/u12zy9uzyt5KhlQLT53v
         M4binXwjgi8tVEeFnNWHQVk0eAVgsWwYd7Uu+EBycOKLzAiRtwQ+TvHq/RfDxG5u2aU/
         Cdug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:user-agent:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:subject:to:from:date;
        bh=NDmQy8APSGqdXhLtfEQkpAk+mJyaDUntodB1qCol+0k=;
        b=EKU//h2eiOvCWFXSnd37l6xT9lx5RlkXGi6ZVv8D/jEdoXurnw3jnPF7YzYq/djgP+
         E5rkWl0Aqzge00SaM6pvNOUKnL0QES5k8wLm7hn23kiDYS1CG/7qaaP+K+7WQKchKefC
         AVKx9g2/c8qvaXJ3vBOJ/kHqP1q7lSUjbgnqFcj6Y16fJu8Rrteh4xpXLOtOq8xQDY52
         seyDE/Hua2+pQU5KWFtgfk+q4fJvMNSvhzPz24Y2CS+f+38CjVUaqe3UyLiYuP67+Ylg
         FmwhbTX2R14g0H3NCaZh2ZnG1VO+ZWu2Jc+JXUEJ8SY0cY5bolkAc4b9zx1H8MBZEqDa
         EB3A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z10-20020a05622a028a00b002e1fbf3c061si2682410qtw.594.2022.03.21.20.09.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 Mar 2022 20:09:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:36656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nWUu0-0004zF-Bh
	for alex.bennee@linaro.org; Mon, 21 Mar 2022 23:09:44 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1nWUtr-0004z3-1L; Mon, 21 Mar 2022 23:09:35 -0400
Received: from twspam01.aspeedtech.com ([211.20.114.71]:31736)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1nWUtp-0005uJ-0U; Mon, 21 Mar 2022 23:09:34 -0400
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 22M2wV8h079675;
 Tue, 22 Mar 2022 10:58:31 +0800 (GMT-8)
 (envelope-from jamin_lin@aspeedtech.com)
Received: from aspeedtech.com (192.168.70.87) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 22 Mar
 2022 11:08:59 +0800
Date: Tue, 22 Mar 2022 11:08:53 +0800
From: Jamin Lin <jamin_lin@aspeedtech.com>
To: =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH v1 0/1] hw/gpio Add ASPEED GPIO model for AST1030
Message-ID: <20220322030852.GB4273@aspeedtech.com>
References: <20220321091453.17113-1-jamin_lin@aspeedtech.com>
 <549ac24b-4636-374c-7086-33588f906be5@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <549ac24b-4636-374c-7086-33588f906be5@kaod.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Originating-IP: [192.168.70.87]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 22M2wV8h079675
Received-SPF: pass client-ip=211.20.114.71;
 envelope-from=jamin_lin@aspeedtech.com; helo=twspam01.aspeedtech.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, SCC_BODY_URI_ONLY=0.833,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 Troy Lee <troy_lee@aspeedtech.com>, Steven Lee <steven_lee@aspeedtech.com>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yUb9bijqhxtI

The 03/21/2022 10:55, Cédric Le Goater wrote:
> Hello Jamin,
> 
> On 3/21/22 10:14, Jamin Lin wrote:
> > 1. Add GPIO read/write trace event.
> > 2. Support GPIO index mode for write operation.
> > It did not support GPIO index mode for read operation.
> > 3. AST1030 integrates one set of Parallel GPIO Controller
> 
> Is the AST1030 a new SoC you are developing ? We don't have a machine
> for it in QEMU. We should introduce the models first if the changes
> are specific to this SoC.
> 
> Thanks,
> 
> C.
> 
> 
I submitted a new patch series for AST1030 model support.
So far, only GPIO driver for AST1030 used "index mode" for write
operation.
Thanks-Jamin
> > with maximum 151 control pins, which are 21 groups
> > (A~U, exclude pin: M6 M7 Q5 Q6 Q7 R0 R1 R4 R5 R6 R7 S0 S3 S4
> > S5 S6 S7 ) and the group T and U are input only.
> > 
> > Test Steps:
> > 1. Download image from
> > https://github.com/AspeedTech-BMC/zephyr/releases/download/v00.01.04/ast1030-evb-demo.zip
> > 2. Extract the zip file to obtain zephyr.elf
> > 3. Run ./qemu-system-arm -M ast1030-evb -kernel $PATH/zephyr.elf -nographic
> > 4. Test GPIO D6 Pin
> > uart:~$ gpio conf GPIO0_A_D 30 out
> > uart:~$ gpio get GPIO0_A_D 30
> > [Result]
> > Reading GPIO0_A_D pin 30
> > Value 0
> > uart:~$ gpio set GPIO0_A_D 30 1
> > uart:~$ gpio get GPIO0_A_D 30
> > [Result]
> > Reading GPIO0_A_D pin 30
> > Value 1
> > uart:~$ gpio set GPIO0_A_D 30 0
> > uart:~$ gpio get GPIO0_A_D 30
> > [Result]
> > Reading GPIO0_A_D pin 30
> > Value 0
> > 
> > Jamin Lin (1):
> >    hw/gpio: Add ASPEED GPIO model for AST1030
> > 
> >   hw/gpio/aspeed_gpio.c         | 250 ++++++++++++++++++++++++++++++++--
> >   hw/gpio/trace-events          |   5 +
> >   include/hw/gpio/aspeed_gpio.h |  16 ++-
> >   3 files changed, 255 insertions(+), 16 deletions(-)
> > 
> 
