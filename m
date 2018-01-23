Received: by 10.28.71.27 with SMTP id u27csp4150148wma;
        Tue, 23 Jan 2018 07:03:27 -0800 (PST)
X-Google-Smtp-Source: AH8x225RIErjxzGr5vsBIwCrUS5qld4myMUty7O6Lkj2JGB6ONT5k0ATujD+I9fhEEZRD8WajXVc
X-Received: by 10.37.131.204 with SMTP id v12mr2805866ybm.240.1516719807586;
        Tue, 23 Jan 2018 07:03:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516719807; cv=none;
        d=google.com; s=arc-20160816;
        b=c11veHfjAQMxxSmjafEBCNpco73mGrHpjM1rkgBgQLzv4YjI7wOfo7NSHq0NA+0pvO
         Mt0olB6xVkx1qsJx1DMpTw8PfRPGTtwwHVQQEBIlBF1zp9s2Am/9HQOBIuMPk3EVZmUm
         PNCznknbGvcZD3fCFkE6JcJB7cH8Mh0db/YZGKE/oPxj/PcOF4sXWP1IPdELldzMw3UJ
         dJzUSsnSHh3n4mqilzeUcaRaP9n02GqPH0b3wKpJpKkLkOoSxkcPII+TjmrlzYcZzzIf
         vCaND33VvgcD5fRjEVPXg3HO534VFoMV0e2eCbkWEKG/bssub0axMlUoyZEeZG4vPd8r
         qd3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to
         :arc-authentication-results;
        bh=96Dqk1E/feyT3Cy36llGN9avesNH0dr2/Q2wRQVYb0E=;
        b=R71qJBP71bI1raJVHf74gNJ0KrGWsrSEzvckgCvbfG3xZHioDSI4e68HyuExUeAXog
         NjcnkdcBqr1aY9osjdHAWahSY6IGJWbRVgnprREe4ht1jHd4bFe46GaXSx3iwPBx/P0T
         YpomcbIadx0oIyrPRf+tGeFlBhZXeIsR2ZF0cg9WM5vGpwnMMv6Tz9wWrTrlM9dSw2Lg
         aRQAMUsZR7H1GzYz1lbr4rXQpgLVEGIpbe5CLUm+aKeANxINpA+xDptgppY108QpyLJR
         NQS1BQ2OlLWin+tF+bt8MnyuBQQ83ilOgs2V6P4MtNJ+LAQTqS9kcEkJZNqIYUFjx6bw
         LJvg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y190si4083008ywe.5.2018.01.23.07.03.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 23 Jan 2018 07:03:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:34062 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ee06h-0002tb-1E
	for alex.bennee@linaro.org; Tue, 23 Jan 2018 10:03:27 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50093)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1ee04L-0001cd-H5
	for qemu-devel@nongnu.org; Tue, 23 Jan 2018 10:01:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1ee04D-0006Dp-HM
	for qemu-devel@nongnu.org; Tue, 23 Jan 2018 10:01:01 -0500
Received: from mout.kundenserver.de ([212.227.17.24]:53534)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1ee04D-0006Bd-7t; Tue, 23 Jan 2018 10:00:53 -0500
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue103 [212.227.15.183]) with ESMTPSA (Nemesis) id
	0M3MGG-1evfVS0nnU-00qzvq; Tue, 23 Jan 2018 16:00:42 +0100
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	=?UTF-8?Q?Guido_G=c3=bcnther?= <agx@sigxcpu.org>,
	Riku Voipio <riku.voipio@iki.fi>
References: <20180123145222.2487-1-f4bug@amsat.org>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <f3ef3c07-33cd-bafc-635d-13c66732ffe2@vivier.eu>
Date: Tue, 23 Jan 2018 16:00:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <20180123145222.2487-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K0:a+Q6k04KFd4X55geg7c8A/I9eCdnE9fumxkZZ+B6/5NE1XC88VG
	qD9C5nrO9oOplL6oNn+rR2lcb2ofSxAMNWKNQ4df+Me0/ZVKHFWAynCglJBHkP6EMr8gCYy
	bzf65VJhZ6W67iGFi6w786J4V+D5W10XgZ8rxe1KBSFEhQYLx5g1ROT3204EIjOIhnk+7HW
	I1FZO39MR68IbcQAB4PWQ==
X-UI-Out-Filterresults: notjunk:1;V01:K0:roOaD/Xcqis=:V1Esq7n0GTX5mIAFUIDYY6
	8/X5KEFuqiTSbA0QiJVLrIdS8xwyvQhOOetxfLtKCdXw60pxCMn2yzVwZ+g4bF/u+QUgzjk1s
	cGq6sC3QwEbXeE1FzQQchpT7vnPkMWjU+ULy+bSn/LGppqmkgAcpZh0buZcbOP/6kcBZSvEnB
	Lm4Ag/SGmmeSMNtXqEKtDGJAJbxymZO3aVTgGUIY9HZoiqSuxiCHDTVjk4nWoXLKA+uWaWzCE
	gvLSi65Kv71wl/YwgT5stOc5onbk9wHDwCobJpYC+LIYDvmkpAHZPgHQts6DfMuQ32CPkocPP
	aXAFuTGQVLIKAz231pJyM0pBzZ2OfPFegq51VHw511uPpnDvjVdUja69rEbm43MhHK1jziGJV
	xTBJnSyYQh1FUJPpCqECPiLOaeoShiekw0iihO2c5TMxkTruDq5NNuUREgqygBZLGmCRhKf8F
	gL+quRWoRRk5MDv8MfxqLNkzM9C3sAaYz5clnAuP+1N8KDybRnH2RowkQxKAOquf9ruyVq+7C
	FqGAIqNcFDxpiWNIFa7lnveCxpm3jhQMoIvbFfziaGXIdbJdzzYPYk2PX76XCiRYdrzf+9giO
	LgYbpNzXHu7tcKoFzP185Sa9sAttIulFGO6inCGImcpePNYpoZfNCLJOhUY0Q32GGKlkxGq9V
	xnHPHoGPEYX5zgJaAx+85lDDf409iIKFBMbsq2/oR/LD24BychZaRp+Hquss2MOlaDewbcqSR
	8dXlzHWvsf3wGRXrvSu08CVDFouPIYvOe6s2OsL5ug3as8RVJ6FadkKxSkk=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 212.227.17.24
Subject: Re: [Qemu-devel] [PATCH] linux-user/syscall: let recvfrom(struct
 sockaddr *) use abi_ulong
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: L82WwPnAQ1Yz

Le 23/01/2018 à 15:52, Philippe Mathieu-Daudé a écrit :
> Currently recvfrom() is restricted to handle 32-bit pointers,
> remove this limit for 64-bit hosts.
> 
> This fixes:
> 
>   31572 socket(AF_NETLINK, SOCK_RAW, NETLINK_AUDIT) = 3
>   ...
>   31572 sendto(3, {{len=124, type=0x454 /* NLMSG_??? */, flags=NLM_F_REQUEST|NLM_F_ACK, seq=1, pid=0}, "op=test:message acct=\"?\" exe=\"/tmp/nl-bad-addr\" hostname=localhost addr=? terminal=/dev/pts/2 res=success\0\0\0"}, 124, 0, 0xfffffa3897d0, 0) = 124
>   31572 ppoll([{fd=3, events=POLLIN}], 1, {tv_sec=0, tv_nsec=500000000}, NULL, 0) = 1 ([{fd=3, revents=POLLIN}], left {tv_sec=0, tv_nsec=499993180})
>   31572 recvfrom(3, 0x112a50eb4, 8988, MSG_PEEK|MSG_DONTWAIT, 0xfffffa3897e0, 0x42) = -1 EFAULT (Bad address)
> 
> Reported-by: Guido Günther <agx@sigxcpu.org>
> Message-id: 20180123120541.GA14216@bogon.m.sigxcpu.org
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  linux-user/syscall.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index 11c9116c4a..28805b1785 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -4032,7 +4032,7 @@ static abi_long do_recvfrom(int fd, abi_ulong msg, size_t len, int flags,
>      if (!host_msg)
>          return -TARGET_EFAULT;
>      if (target_addr) {
> -        if (get_user_u32(addrlen, target_addrlen)) {
> +        if (get_user_ual(addrlen, target_addrlen)) {
>              ret = -TARGET_EFAULT;
>              goto fail;
>          }
> @@ -4053,7 +4053,7 @@ static abi_long do_recvfrom(int fd, abi_ulong msg, size_t len, int flags,
>          }
>          if (target_addr) {
>              host_to_target_sockaddr(target_addr, addr, addrlen);
> -            if (put_user_u32(addrlen, target_addrlen)) {
> +            if (put_user_ual(addrlen, target_addrlen)) {
>                  ret = -TARGET_EFAULT;
>                  goto fail;
>              }
> 

I think there are more problems like that (accept4(), do_getpeername(),
do_getsockname()).

Could you check and fix?

Thanks,
Laurent

