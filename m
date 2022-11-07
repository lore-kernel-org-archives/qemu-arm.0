Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp2979381ejx;
        Mon, 7 Nov 2022 05:03:31 -0800 (PST)
X-Google-Smtp-Source: AMsMyM5QY5xG4WwU9MfRTw/E6cjBBUQsEDbH42Z+OYgCZNmaLbN/JF/ydDQxAjP/uaePNpb0PVM7
X-Received: by 2002:a05:620a:22cf:b0:6fa:1e61:9cda with SMTP id o15-20020a05620a22cf00b006fa1e619cdamr32263159qki.774.1667826211065;
        Mon, 07 Nov 2022 05:03:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1667826211; cv=none;
        d=google.com; s=arc-20160816;
        b=iZId9IBjpvZkBhIrgfHaCNWzcIiXPe3tBzU9jRzTwtdvZv443OAban5+V0gTYxvgG2
         x7k6k4mmGzTN5b2Vflh+hv2BjXCc7Mp12l05HdsoGoFpgQbGssOzT4YLT/YmdFGPo8SB
         mfPj1SN3pvj1LwKbq1wnllWIuBGCeE3HcPc6pZhh5RgbZoSHsXcUpCJvi1ZdjRnksSXH
         FzBNzoYEw33D+OEHGF0msFpgkTkG1aFOzguX/Wu3OcgwmYXLmfRkk4Pa6USVg3/XTVTD
         nXdHI9vyMi5wvjSjjB5Fqd2OWtymMMQEdev/HxG7Ip6ycl56CKuFQGWdljUmGPYAqsC4
         d1qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:references:message-id
         :content-transfer-encoding:cc:date:in-reply-to:from:subject
         :mime-version:dkim-signature;
        bh=/ESFzzkP6mHGND0cqItFaGCfupdYs+rk+gbj7Nb53NY=;
        b=az62CoC6T7pDagjdKI/Ix3nLUnz8VZy0YGSk7W0afKQBb34qYxKb+HfYuuNM3Basqm
         RXYIGHcKwfTilX0R+uIrCByD1jUDmLDDowP1LFXYvSHTkEXi2RZX/CZ0zSDVnKDy2UV/
         NDibsvOBBnszaAaoWC1hVN3IdfWlttXDs+AKoxrW/53CIoNZ77XRdF6z+EKIT+LimHDQ
         3A4qdr8y6nVlE+Do7qw4XLtUWqjFubtAEqLpxRpUa9UhGFakiikEFATOphPILXwjcGDG
         xDBTutyGAtJNRRHVf4p++zNndLSkMxuWMalT7lUHzA+ENdvGz6SdDnVhnHdQkNgWXe8Y
         85Pg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ynddal.dk header.s=sig1 header.b=JyxXl4xn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h10-20020a0562140daa00b004bb93b921afsi4429455qvh.331.2022.11.07.05.03.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 07 Nov 2022 05:03:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ynddal.dk header.s=sig1 header.b=JyxXl4xn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1os1l4-0004d4-V6; Mon, 07 Nov 2022 08:01:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mads@ynddal.dk>) id 1os1kt-0004ZP-VZ
 for qemu-arm@nongnu.org; Mon, 07 Nov 2022 08:01:36 -0500
Received: from mr85p00im-zteg06021901.me.com ([17.58.23.194])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mads@ynddal.dk>) id 1os1kn-00021Z-NV
 for qemu-arm@nongnu.org; Mon, 07 Nov 2022 08:01:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ynddal.dk; s=sig1;
 t=1667826066; bh=/ESFzzkP6mHGND0cqItFaGCfupdYs+rk+gbj7Nb53NY=;
 h=Content-Type:Mime-Version:Subject:From:Date:Message-Id:To;
 b=JyxXl4xnqpDcJgfpBA8Zd+30CnAKM9lrwSy0jc940GSLG1fw+WqdhpBhVUunArhFr
 l0Nwx3s/MhelH7if6niK2x6g1mM2y/ELVCy167mP4Z2l+X7hPDo2MD0LJdlUjZsm7C
 BEo/j66QQ8CHXP4anFRRFMAyQAOj+U/Re9Jwiq9+J3W4j3juhwMzFRVgoeE+ubo6vT
 Bm6RAbuAolQQ9JyndFgrUvZxK/303sEMPIeA/O3nu7WbMYitpezU2uF4EMUnXvdwcp
 xCqnCFEm/4DQDkLl7M/vJycDFvpEcD6c1uw5bAfc/IVFIBqTWugtgOLXyOw6yeTTXf
 s+k08OGwSZZeQ==
Received: from smtpclient.apple (mr38p00im-dlb-asmtp-mailmevip.me.com
 [17.57.152.18])
 by mr85p00im-zteg06021901.me.com (Postfix) with ESMTPSA id 08105740B2C;
 Mon,  7 Nov 2022 13:01:03 +0000 (UTC)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.200.110.1.12\))
Subject: Re: [PATCH 1/3] arm: move KVM breakpoints helpers
From: Mads Ynddal <mads@ynddal.dk>
In-Reply-To: <20221104184101.6923-2-fcagnin@quarkslab.com>
Date: Mon, 7 Nov 2022 14:00:42 +0100
Cc: qemu-devel@nongnu.org, dirty@apple.com, r.bolshakov@yadro.com,
 peter.maydell@linaro.org, qemu-arm@nongnu.org, agraf@csgraf.de,
 pbonzini@redhat.com, Francesco Cagnin <fcagnin@quarkslab.com>
Content-Transfer-Encoding: 7bit
Message-Id: <FB8D474A-61B8-4E88-A7A3-FAEFA5CF4C67@ynddal.dk>
References: <20221104184101.6923-1-fcagnin@quarkslab.com>
 <20221104184101.6923-2-fcagnin@quarkslab.com>
To: francesco.cagnin@gmail.com
X-Mailer: Apple Mail (2.3731.200.110.1.12)
X-Proofpoint-GUID: S5bEc1N1UWmEjErFLeO3R6An9L01VXCz
X-Proofpoint-ORIG-GUID: S5bEc1N1UWmEjErFLeO3R6An9L01VXCz
X-Proofpoint-Virus-Version: =?UTF-8?Q?vendor=3Dfsecure_engine=3D1.1.170-22c6f66c430a71ce266a39bfe25bc?=
 =?UTF-8?Q?2903e8d5c8f:6.0.138,18.0.572,17.0.605.474.0000000_definitions?=
 =?UTF-8?Q?=3D2020-02-14=5F11:2020-02-14=5F02,2020-02-14=5F11,2020-01-23?=
 =?UTF-8?Q?=5F02_signatures=3D0?=
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=699
 mlxscore=0 spamscore=0
 adultscore=0 phishscore=0 bulkscore=0 clxscore=1030 malwarescore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2211070106
Received-SPF: pass client-ip=17.58.23.194; envelope-from=mads@ynddal.dk;
 helo=mr85p00im-zteg06021901.me.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: pmcGN4DWRcsr


> On 4 Nov 2022, at 19.40, francesco.cagnin@gmail.com wrote:
> 
> From: Francesco Cagnin <fcagnin@quarkslab.com>
> 
> These helpers will be also used for HVF. Aside from reformatting a
> couple of comments for 'checkpatch.pl', this is just code motion.
> 
> Signed-off-by: Francesco Cagnin <fcagnin@quarkslab.com>
> ---
> target/arm/debug_helper.c | 241 +++++++++++++++++++++++++++++++++
> target/arm/internals.h    |  50 +++++++
> target/arm/kvm64.c        | 276 --------------------------------------
> 3 files changed, 291 insertions(+), 276 deletions(-)

Looks good. I was going to do the exact same in my patchset.

Reviewed-by: Mads Ynddal <mads@ynddal.dk>
