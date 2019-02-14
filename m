Received: by 2002:adf:efc1:0:0:0:0:0 with SMTP id i1csp755188wrp;
        Thu, 14 Feb 2019 01:31:16 -0800 (PST)
X-Google-Smtp-Source: AHgI3IZJ8DuUKMHr8OnAUWdqftSuhv2PVa6YEBk1T6p9wqWU6ViK1qEX2tCN1Su4Cwa734pYaLER
X-Received: by 2002:a25:3f86:: with SMTP id m128mr2127214yba.315.1550136676864;
        Thu, 14 Feb 2019 01:31:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550136676; cv=none;
        d=google.com; s=arc-20160816;
        b=QQQCs2T6qN55wZbl9CSlh5xL6ULwpKi58NTDnuEdwJwQu7Pa7sGLR6FtpnSjg6IgGq
         zpfXBjYZx3TzMUeVDf8o6GCZ9fAqYdnuIjiCFU2GSnJhO8REcQlCQlHfuqWo2PjNrAXM
         5r2sYA1gib2qCvraqKPxvV7R1Ba6Yh79vmjpoOgtuqmvXQNmFgYJIoXeEi8eAiYEJEQh
         BZ/iAFW2HFbp8HznIj2RQTo/15MXvwmbs+DB27Z/aOeFs4k/gKGPNGxs1RJwGkS+iS23
         LHq/pig/2k7GjCnR3OKokp8M4o7YYKnL3u1gFEIQsjzB3MqcNw9M0c/YcEk1qSSgyP7g
         qusA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=2ycppfDAZWsITiLoA2+lmV2peyIxutHKIqrXq3LFC8I=;
        b=XOTV3iyM50K8dmmM0EC5Fmg3a4lqRNeDVJKkD70WnAtogIbRSCMQN6xpIAVWx9xvMq
         zazz9KW2elGHO1HP8uK2LLlvby7DrSRLgPAgbm9roawoMa3GCoqVtfcZMgJkp1su7alo
         IaSNlsBWtEbkgUHBO73pSigzw9O+5FpzL1gsueHeh3T/gt5VKulRoeJ6zjXVurqtJaVz
         VyCKY0VDJKUE4BcgQUakOOMlqTkidQ62dKNwhn1IGGyH1yJw7yxabnu+Hv6lsNbzdZuT
         Lhbgz/w7QIhubqScMfc94YfPgtra9hFPEouxC0noxAVJoD8Bq9G6Pl8AA6vXPAyRM+Wa
         cCXQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l189si187529ywg.418.2019.02.14.01.31.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Feb 2019 01:31:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:44373 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1guDMS-0002uY-AO
	for alex.bennee@linaro.org; Thu, 14 Feb 2019 04:31:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54643)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1guDKD-0001mu-0v
	for qemu-devel@nongnu.org; Thu, 14 Feb 2019 04:28:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1guDGS-0003DI-G4
	for qemu-devel@nongnu.org; Thu, 14 Feb 2019 04:25:05 -0500
Received: from mout.kundenserver.de ([217.72.192.74]:36647)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1guDGS-0003Be-68; Thu, 14 Feb 2019 04:25:04 -0500
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue108 [212.227.15.183]) with ESMTPSA (Nemesis) id
	1N3bfB-1h3SH71pTP-010cZ6; Thu, 14 Feb 2019 10:25:02 +0100
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20190212074840.13542-1-richard.henderson@linaro.org>
	<20190212074840.13542-2-richard.henderson@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <8e47e7c3-1903-0a02-dc05-43ddc5b8e299@vivier.eu>
Date: Thu, 14 Feb 2019 10:25:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20190212074840.13542-2-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:Qh44oR3pbDSYxk5Qp8iiZlx5+GQO+qdlK8KLzPmcAfXLcyJt+Dj
	LYTF47BKkiteyyS35fS9oceE+YSOYXzSHQ8zQ2HICriN49RBa6wPqH3SJBss4rsIzVvq+p9
	CnX+dp2gVKlaFz5shgyP2emRAsSWEgxo2nN1HTfdwZVneWIjT8zz+eMgzfmvfMNUkNrRKHa
	wWGw5PgxkQGScMWBc0WCQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:7Y2iiv2E0vo=:sVCDbppMe1kTCe03LQjBDz
	2cdbRsglHaPBeYcmIJvy/NB49F/Zr4h46fEM7sFmf9j5qiJ0DFa0rKleW7MVani3Jx0PlH3lE
	deu5p4eEqQ+pzuXirWdyHDaTEfjvSflbfTAnTvg9DIcYT+6Nv8wy+rLGRwoV5DE0KEngt8vK+
	WzHgQCle4EOAl9pNKHubUj7DAdDGQvMFKqZrQco1vMwGxKhrQX2Ks6SZFuw1K9OnC9rYsuxq/
	jQsOrxys2ZvitaGKdhe4LAK3XqraoLrPEVkf8qqdOZ72kevloVRZbE48D01RdtWYNSw78hsaC
	2yUn3Z8tYct76Yh6/cCEMm8xKDWv+PdCWZrNpYvH08YHoUB+3tUsMhdyWYEsn/gD/J4wwksty
	Q5N4SG4WzXOO/kiS8GPkfCsNqtI2+qTgByJRcgEyy+S8tynlX5yI/bnjiBCptBdLQno75A/Ke
	tqPEi7ZbLHHQBLkvwlNBH5HihwYJGvSJAVkdHkOIEkywT6fTQ7OnisRo+kTcDmuzZfj+UIZi4
	SPy/f8UOt/WQGsKneKXniw+Z/vw2x0IqDPOxJjHWF0bb7P8hEYh3g2V8vfDLnI6JW8biAGgGH
	TsL6nyluOKJ+FgewL+FhxuVa7DvKCxy6JITn9HrSKUNBT//4Ep8lz03DGjnnbRqhBImOyC3kT
	njGmcFwwFy5tZllvJcY+ieilDbk3sbqYWuqEHvPfSbUfLqSIo3Upgo+JNDOnKGFR927Q2oARn
	cy7bqlnbzh0kcmTljxLifBRjycWo8Thi6qIAm14xsIf/WlwHPyCwefcnuTM=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 217.72.192.74
Subject: Re: [Qemu-devel] [PATCH v2 1/2] linux-user: Add ELF_PLATFORM for arm
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8Nt6yCxY458Q

On 12/02/2019 08:48, Richard Henderson wrote:
> The 32-bit kernel has strings for v4, v5, v6, v7, v7m.
> The 64-bit kernel, in compat mode, has strings for v8.
> 
> Fixes: https://bugs.launchpad.net/bugs/1813034
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> v2: Include v8.
> ---
>  linux-user/elfload.c | 31 +++++++++++++++++++++++++++++++
>  1 file changed, 31 insertions(+)

Applied to my linux-user branch.

Thanks,
Laurent

