Received: by 2002:a17:504:76a5:b0:1be9:327d:8ee3 with SMTP id sy5csp2742933njb;
        Mon, 3 Mar 2025 08:52:01 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWUadJbbHpDp/j84xJ6WfGJMJp10DfUidUPLQjiXapOaKo187ifIDQ6dKN9R1YU3uIWuZpzdDXjmwl9tA==@linaro.org
X-Google-Smtp-Source: AGHT+IE+T+EqVYWX4yLZLUwHCQIlVk5qYQwBdwBUWT23XWL+CTHb6nkWTb8P7fmUlHBPbmvB9C3q
X-Received: by 2002:a05:622a:19a5:b0:472:1f07:7a9 with SMTP id d75a77b69052e-474bc08f1admr216431961cf.31.1741020721608;
        Mon, 03 Mar 2025 08:52:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1741020721; cv=none;
        d=google.com; s=arc-20240605;
        b=AUl2Kj6j2ctLmz2RlUOQq1oHFmgNMGCKsDsa7jxq7eDOOhpdOa6qoXr5XKWsWVt0AY
         KImV6Mo5tQ3jcTYNjrK2Sghcl4jcGQVaPz9xYx5H01UtrEhqtCCVYMjYvC5c2Zt2EPnM
         90icjaWNMg3yGE7HQ94y2MGXsdl6f+vrwGA9v2hoUM2ynWMusRLjt1PqRLOOfjptJAeu
         STtQkgPqiTmQw/m0ft04sZWXYk6LChQpQ/GOTsleGyxC7f00uOatJj9/cbwuhIdeNUT7
         czPFwNg9w5j0tV5iWGUxgnY8PazkACsGNSmj3jiYX/WSfRFT4Tg8FyjX7n1sofHgJVsP
         3taQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id;
        bh=AjqVMBZqTR3c7Z6GNVP/otMpq9Kb3bhC/G/QnaUgdLE=;
        fh=JUqExWdVyO9KjlFCuMigXej9m2rYeji+PtTsDk1BqAY=;
        b=CnCXUkrbepMHZY5F+gm7+gj6ePeDI7EHhZXpaSMYs3iRfN7FNtYHhJNjmhJMW8TxEg
         km7r6iywxplflt+JJGyRUOzD59mrzdzU99Ydr5Yq7NKfxUEC+drzbxyjs083kp0G0f/U
         EznWINXedu62sqLADItrRKBwPfoysEiLfO3XZ7M/zS0fX+9Na/edAesQtUpqTPYV+fSQ
         ax1Sz1sFhD74lpH519mbD0oOOkFyKSyjVsSefh231MhhXHVpzOm46hHvmJ6PTTKhUx7B
         xRlt73ug+qadomIxq5CjmjhLqsTaydBhI/NAFquQnoqtAxeg0NWGXmYMXwrsqcsxpCwI
         wZ/w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-474ea2f1051si21363711cf.524.2025.03.03.08.52.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 03 Mar 2025 08:52:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tp90x-00050U-Q2; Mon, 03 Mar 2025 11:51:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=Robu=VW=kaod.org=clg@ozlabs.org>)
 id 1tp90e-0004qH-BK; Mon, 03 Mar 2025 11:51:18 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76] helo=mail.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=Robu=VW=kaod.org=clg@ozlabs.org>)
 id 1tp90V-0003Oe-En; Mon, 03 Mar 2025 11:51:12 -0500
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4Z64ZP4qhcz4x21;
 Tue,  4 Mar 2025 03:50:53 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Z64ZL2DHYz4wcr;
 Tue,  4 Mar 2025 03:50:49 +1100 (AEDT)
Message-ID: <fe5a2bbd-789c-4add-b256-700d98f6a107@kaod.org>
Date: Mon, 3 Mar 2025 17:50:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 21/23] tests/functional/aspeed: Update test ASPEED SDK
 v09.05
To: Jamin Lin <jamin_lin@aspeedtech.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>
Cc: troy_lee@aspeedtech.com
References: <20250303095457.2337631-1-jamin_lin@aspeedtech.com>
 <20250303095457.2337631-22-jamin_lin@aspeedtech.com>
Content-Language: en-US, fr
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Autocrypt: addr=clg@kaod.org; keydata=
 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
In-Reply-To: <20250303095457.2337631-22-jamin_lin@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=Robu=VW=kaod.org=clg@ozlabs.org; helo=mail.ozlabs.org
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.001, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: JQVguAa57s72

May be add a little comment about the new ast2700-a0-default OpenBMC
build in v09.05.

On 3/3/25 10:54, Jamin Lin wrote:
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>


Reviewed-by: Cédric Le Goater <clg@redhat.com>

Thanks,

C.


> ---
>   tests/functional/test_aarch64_aspeed.py | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/tests/functional/test_aarch64_aspeed.py b/tests/functional/test_aarch64_aspeed.py
> index 07b0c7c1fd..8df6a97a28 100755
> --- a/tests/functional/test_aarch64_aspeed.py
> +++ b/tests/functional/test_aarch64_aspeed.py
> @@ -27,9 +27,9 @@ def do_test_aarch64_aspeed_sdk_start(self, image):
>           wait_for_console_pattern(self, '## Loading kernel from FIT Image')
>           wait_for_console_pattern(self, 'Starting kernel ...')
>   
> -    ASSET_SDK_V903_AST2700 = Asset(
> -            'https://github.com/AspeedTech-BMC/openbmc/releases/download/v09.03/ast2700-default-obmc.tar.gz',
> -            '91225f50d255e2905ba8d8e0c80b71b9d157c3609770c7a740cd786370d85a77')
> +    ASSET_SDK_V905_AST2700 = Asset(
> +            'https://github.com/AspeedTech-BMC/openbmc/releases/download/v09.05/ast2700-a0-default-obmc.tar.gz',
> +            'cfbbd1cce72f2a3b73b9080c41eecdadebb7077fba4f7806d72ac99f3e84b74a')
>   
>       def start_ast2700_test(self, name):
>           num_cpu = 4
> @@ -89,11 +89,11 @@ def start_ast2700_test(self, name):
>           exec_command_and_wait_for_pattern(self,
>               'cat /sys/bus/i2c/devices/1-004d/hwmon/hwmon*/temp1_input', '18000')
>   
> -    def test_aarch64_ast2700_evb_sdk_v09_03(self):
> +    def test_aarch64_ast2700_evb_sdk_v09_05(self):
>           self.set_machine('ast2700-evb')
>   
> -        self.archive_extract(self.ASSET_SDK_V903_AST2700)
> -        self.start_ast2700_test('ast2700-default')
> +        self.archive_extract(self.ASSET_SDK_V905_AST2700)
> +        self.start_ast2700_test('ast2700-a0-default')
>   
>   
>   if __name__ == '__main__':

