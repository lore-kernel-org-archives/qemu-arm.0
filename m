Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp762152wru;
        Wed, 1 Aug 2018 06:29:55 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpdZWZQOwLmMljmV2yu/xy5fTfgFHZgG+MpBavFUl+j41kXnsbDznpf85DCovY99tp/AypwC
X-Received: by 2002:ac8:1642:: with SMTP id x2-v6mr25323668qtk.107.1533130195442;
        Wed, 01 Aug 2018 06:29:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1533130195; cv=none;
        d=google.com; s=arc-20160816;
        b=0naLqT7s2kUMGvX3TFpGV8AzjJLv5w3gdJUHh2VTaZHDaGRFpwkqtJ8KE5QRWws0he
         3fdY+rm5K7NeiiodTmVJH8XS9Dp+xIztpIGyPg6UNTFzl10dfidirsAeC5754iK47j/M
         9OZ7ng+ak7DYQ1+Ji5WfWySYEr8XTx2OZ94o0IXEJ0yC8gLlwB1Z5V5QwA9wPVUVOJpU
         oVB7mUd9/HautjD0CLtG6NejTUJiosckxZEAraiyb9yJ968L/jKpmDMmfYlQB+D/W7gy
         RwKMFkE+HjeeDvWAv9MLT8lx2sQ473NqNyR/CKmnu8O+EL9qPuO6924d5yC9M5eq+ZoS
         MqKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=7O22/YVhNAwOdxcfBZRk/kDCPwXRO5msBgM7IeTSDmU=;
        b=kGQQZ+2eYMwQZt7MRe/Z5CMY9fMob2jnblUKrSrCxNCgigcZSpQCqUNRj5MszZBo5n
         h8Pr1J9DlJWRJOwHsnIQb7+T+f1fQuvhRLJbYhbgAQc7H4pRh7RDlEwgwxuB73M6tc8Q
         Y7higzS86Phnlgyp0QAiTBUFiCyWKOHIhSSgzLgQTnRekTJlcfcFxjK/ct6wwcj9urVJ
         WBv/2Cj9rGZZBg6naOxFDWmgx+usCDDWTLMnvvtnFsHJKhupEuvNKhqvKeza87qJHbOz
         Hg+BhXIPyH81NT8iYBCfVD0YDK9+MgmmH+/NVnzxNGeV+2T+DCPTIdFDHIXzY4isloON
         jJSQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="K/AlyNzd";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b3-v6si509406qvm.158.2018.08.01.06.29.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 01 Aug 2018 06:29:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="K/AlyNzd";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:40111 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fkrCM-0001pJ-TH
	for alex.bennee@linaro.org; Wed, 01 Aug 2018 09:29:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42965)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent.desnogues@gmail.com>) id 1fkrBW-0001B4-57
	for qemu-arm@nongnu.org; Wed, 01 Aug 2018 09:29:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent.desnogues@gmail.com>) id 1fkrBV-0005km-78
	for qemu-arm@nongnu.org; Wed, 01 Aug 2018 09:29:02 -0400
Received: from mail-qt0-x242.google.com ([2607:f8b0:400d:c0d::242]:35565)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent.desnogues@gmail.com>)
	id 1fkrBT-0005jv-1J; Wed, 01 Aug 2018 09:28:59 -0400
Received: by mail-qt0-x242.google.com with SMTP id a5-v6so19808751qtp.2;
	Wed, 01 Aug 2018 06:28:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=7O22/YVhNAwOdxcfBZRk/kDCPwXRO5msBgM7IeTSDmU=;
	b=K/AlyNzdSvQhQTV68vxLqp/oZqd9mP9jybtPDpn5L6fpFUH0GCHvGwYJwmg9IEEtnE
	2lSWCxmipvZQYJDULbKc1ZJ/vIWSd8XXbi1G0mBE0P4+iM0V6bhqL7ydoUHl5R5TziCJ
	D19RZlC261Csy5XRRMOOepgCBy24v8B1I3P8am6KEO7qH0Jf9YBWwkIjt/BFl18YETao
	GxEVqN+K30ae5yU9FHZouMhxDglNX774YcE//GkRSKc32EREncvKVU+F08Nu4C4RTlmK
	gJ4reZkxeTkO08y8syhd+8+WZqGNRNjS+PdDe7bU5cd/OC1zGEKz/Slwx9ANmJduTlzH
	eutA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=7O22/YVhNAwOdxcfBZRk/kDCPwXRO5msBgM7IeTSDmU=;
	b=IU/PdlEYC8fXehPvmxKsk9DOyYRX9jTfzWoss1D5MtLoUXnMPvBEMCPheCkaBjyfHR
	ezTxDh84i30WOdXMOqAsTxVwM9O93CN84tRVde6bnZM2hM6vKTj9CDs6JNt4t8NpcmY2
	HLmK0prKPnDyzHk5L++7rYTrliGQFsRExRE1NwvGQr9fYY6K60wCvv+vumQLYW8LC2s9
	hK/gVY3w7rxh4L6dxpmnl2TTSw1XNGTsmTn2cydDr2BecYtrUdvIIblA1YE0KVZcrouP
	8b4/eDPQkRJsrJPwZIEq/RuT2h1VB2MrEoKKrgBgwqKgqA+7J9SiVWvEgp6MHCdBfNw/
	88Ug==
X-Gm-Message-State: AOUpUlHWOQbjByAvX8+Qs96Q/7TlBz1HuONFRzVtfUyuRRQZWfqWYLkK
	wQ0CwX6TxSc4LvmcL8SdHLhEOZ6mB457ORuEhAQ=
X-Received: by 2002:ac8:524f:: with SMTP id
	y15-v6mr24881130qtn.227.1533130138433; 
	Wed, 01 Aug 2018 06:28:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac8:12c6:0:0:0:0:0 with HTTP;
	Wed, 1 Aug 2018 06:28:57 -0700 (PDT)
In-Reply-To: <20180801123111.3595-5-richard.henderson@linaro.org>
References: <20180801123111.3595-1-richard.henderson@linaro.org>
	<20180801123111.3595-5-richard.henderson@linaro.org>
From: Laurent Desnogues <laurent.desnogues@gmail.com>
Date: Wed, 1 Aug 2018 15:28:57 +0200
Message-ID: <CABoDooOD9Z2u=QPt58Lhv5yB=aAYEufNmbPn0Uxo=zf_WLb0ig@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::242
Subject: Re: [Qemu-arm] [PATCH 4/4] target/arm: Fix typo in helper_sve_movz_d
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HF2KYl4VLSyi

On Wed, Aug 1, 2018 at 2:31 PM, Richard Henderson
<richard.henderson@linaro.org> wrote:
> Reported-by: Laurent Desnogues <laurent.desnogues@gmail.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Laurent Desnogues <laurent.desnogues@gmail.com>
Tested-by: Laurent Desnogues <laurent.desnogues@gmail.com>


Laurent

> ---
>  target/arm/sve_helper.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
> index 87594a8adb..c3cbec9cf5 100644
> --- a/target/arm/sve_helper.c
> +++ b/target/arm/sve_helper.c
> @@ -1042,7 +1042,7 @@ void HELPER(sve_movz_d)(void *vd, void *vn, void *vg, uint32_t desc)
>      uint64_t *d = vd, *n = vn;
>      uint8_t *pg = vg;
>      for (i = 0; i < opr_sz; i += 1) {
> -        d[i] = n[1] & -(uint64_t)(pg[H1(i)] & 1);
> +        d[i] = n[i] & -(uint64_t)(pg[H1(i)] & 1);
>      }
>  }
>
> --
> 2.17.1
>
