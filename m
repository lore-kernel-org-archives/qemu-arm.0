Received: by 10.80.163.71 with SMTP id 65csp146019edn;
        Fri, 30 Sep 2016 03:42:41 -0700 (PDT)
X-Received: by 10.55.48.10 with SMTP id w10mr6136349qkw.43.1475232161129;
        Fri, 30 Sep 2016 03:42:41 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i184si11502628qkc.179.2016.09.30.03.42.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 30 Sep 2016 03:42:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:43098 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bpvH6-00045n-L2
	for alex.bennee@linaro.org; Fri, 30 Sep 2016 06:42:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50489)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1bpvH2-00045i-OZ
	for qemu-arm@nongnu.org; Fri, 30 Sep 2016 06:42:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1bpvGx-00049E-Od
	for qemu-arm@nongnu.org; Fri, 30 Sep 2016 06:42:35 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50992)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>)
	id 1bpvGx-000498-Hs; Fri, 30 Sep 2016 06:42:31 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C94C1C04B924;
	Fri, 30 Sep 2016 10:42:30 +0000 (UTC)
Received: from [10.36.116.62] (ovpn-116-62.ams2.redhat.com [10.36.116.62])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u8UAgSoS016987
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 30 Sep 2016 06:42:29 -0400
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-devel@nongnu.org,
	peter.maydell@linaro.org
References: <1475230780-8669-1-git-send-email-edgar.iglesias@gmail.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <4496a78f-e527-fae4-0bc5-a9f1c0d5c997@redhat.com>
Date: Fri, 30 Sep 2016 12:42:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <1475230780-8669-1-git-send-email-edgar.iglesias@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Fri, 30 Sep 2016 10:42:30 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v1 1/1] target-arm: A64: Fix
 decoding of iss_sf in disas_ld_lit
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
Cc: edgar.iglesias@xilinx.com, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 072PZloXHrxO

On 30.09.2016 12:19, Edgar E. Iglesias wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
> 
> Fix the decoding of iss_sf in disas_ld_lit.
> The SF (Sixty-Four) field in the ISS (Instruction Specific Syndrome)
> is a bit that specifies the width of the register that the
> instruction loads to.
> 
> If cleared it specifies 32 bits.
> If set it specifies 64 bits.
> 
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
> ---
>  target-arm/translate-a64.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/target-arm/translate-a64.c b/target-arm/translate-a64.c
> index ddf52f5..eae25c3 100644
> --- a/target-arm/translate-a64.c
> +++ b/target-arm/translate-a64.c
> @@ -2025,7 +2025,7 @@ static void disas_ld_lit(DisasContext *s, uint32_t insn)
>          do_fp_ld(s, rt, tcg_addr, size);
>      } else {
>          /* Only unsigned 32bit loads target 32bit registers.  */
> -        bool iss_sf = opc == 0 ? 32 : 64;
> +        bool iss_sf = opc == 0 ? false : true;

You could simplify that to:

	bool iss_sf = !(opc == 0);

 Thomas

