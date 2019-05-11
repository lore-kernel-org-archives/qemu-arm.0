Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp390512wrg;
        Fri, 10 May 2019 17:11:21 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyKKy9yaWl6pc3oITYg6DUuRgLs+9IfNzoQYzZERjdLRCadqojvnF01bkRj5dTmG6nXeAwk
X-Received: by 2002:a17:906:a48:: with SMTP id x8mr11278842ejf.247.1557533481542;
        Fri, 10 May 2019 17:11:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557533481; cv=none;
        d=google.com; s=arc-20160816;
        b=zo34hsat8qXlLXVwVeJiBDJ+fwgXjMdNSG/p6XVC2XlI3MqUMXAOvXXaGpDzzgwBUD
         TcM1kZekgqU0eybi5y6AVgR/tg6i7hxZ3Tptcv1PzlWEd7ZHCGEdctntoPUmXLws+BdL
         sbsd77TWQbGO2gSDs0bEY+ryFCnF1hqKzseA9y+QqM5bigD7GjkqMm8sVF0olSD31JK+
         Hl0kDwSydw479AOOOzCNa3kFB+2IxlVV8ACNL0xiY0tEGNVQVUpAAqGeUAPEC9HaEEzR
         YKUfmYV96CJOJ5GPTjNnvwIP2UdwSvSxsE0sDz50xWFGwnRdfeeh8iITDbMROh1LjY3x
         Q7vA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:subject:user-agent
         :in-reply-to:content-disposition:mime-version:references:message-id
         :to:from:date:dkim-signature;
        bh=GA4jyekjY6xXU5QxQG4iMKgvD1YOHe3YtFrceeyDa4g=;
        b=aQJq6/ns4yPlnGFbPbMDjp0uDv16eF1cg/iTQ6SFVYMOXD5N2FIv0cPn6OCzA0R7ZX
         SG1bLi5gYVdulP5KQi1myAtkbxcTFy+iDQjkA56gKWcbQHmki3Mln1CiG8MwMkiThsxs
         CukQvaL4abI0cm0NgowidgHUMTzzQZ1ZwmwLAbkY+GjFvjs/MQBDlzJqLhLO6LlDxW4Z
         7rBDp5WKkYJEIWYSf5p+XvFhKqgo6Rl3NWelTskh6HsemYB3bnywtj2AlVARawSjESNc
         S97aEUrNr9HiBTnekjunTAAzCjSh3UlhrOUFVIlVicCDbUxDee/EB9yAWP73lhh+j0A3
         WgQw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=FqaSsG8D;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t22si3860836edb.422.2019.05.10.17.11.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 10 May 2019 17:11:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=FqaSsG8D;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([127.0.0.1]:51801 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hPFbk-0000X0-Js
	for alex.bennee@linaro.org; Fri, 10 May 2019 20:11:20 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42477)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.weiyang@gmail.com>) id 1hPFbW-0000T0-Dn
	for qemu-arm@nongnu.org; Fri, 10 May 2019 20:11:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.weiyang@gmail.com>) id 1hPFbV-0002eK-Jy
	for qemu-arm@nongnu.org; Fri, 10 May 2019 20:11:06 -0400
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542]:35654)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.weiyang@gmail.com>)
	id 1hPFbT-0002cc-Rl; Fri, 10 May 2019 20:11:03 -0400
Received: by mail-ed1-x542.google.com with SMTP id p26so7421041edr.2;
	Fri, 10 May 2019 17:11:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=GA4jyekjY6xXU5QxQG4iMKgvD1YOHe3YtFrceeyDa4g=;
	b=FqaSsG8D8FnVfT8nSZcZfALbZvbSvx8J3Nwzv3ZwiyklEp0VSK9e4arKfJdQ6Ngvcs
	6hnb0qBH8fanYwxBbMZhSJ0CIxlOy7oOa6FSVPfHex7bw1LHsg1y/rYXGliJjevDY/vm
	cnp6VlZp3VWFoaiZHsb0LN0o9MKhO0Wl947+OqVsTFQg/5RwnPiMJFCLx+OuCwHOyoBx
	yL+sFSnq0iPNzCWKF0+iOKV9LywexGfRsEoxuLKBN13y/7PsEqCFLTPvBfqSmNEyaAMz
	I+9AOFB6vW0gWGzo+I1k8rTTMIL5bEAsWFxq/jKw4hDZWanZHtJyW3Nu+Ng5sH4VXPao
	Jw/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
	:references:mime-version:content-disposition:in-reply-to:user-agent;
	bh=GA4jyekjY6xXU5QxQG4iMKgvD1YOHe3YtFrceeyDa4g=;
	b=mjG6hrBTJcUpdbIsTWSUzm1wum3mcjRmo6IaLk/80uWnIu+WJg29Eqj54ZmjghdCUz
	QrqDhne6mp6fxiqLKmZRBOyNZtzuu1wT54e0+K59CmfQWXgcfxWwy2/cvSIg+8TfNhdD
	/uic6jg3flKtu7zHeZLslndn9zuzJcsQhcwaJyk9RGnx7UO/N1rDKvx1dMJiUocEpHVa
	bzCDOcqJoY5kEEmiEOHEWP7kLPV8g+FmtjfixHvRgdhzffkQl4nJZWq0hEJSW/P1HgAk
	IBGroEhUIQzhZsU4N+DzkKgA/dHoXnMbN+U6hgs6EBMRPkFYoh9EtF7N/kWrdjVXcFVf
	t9cA==
X-Gm-Message-State: APjAAAX/hrSFpms1f3ULLlFUhYS18J/728Pow/IU8aswaxLOk8Ck546C
	H4q3/2uFh9mzEuoQLGZcQPA=
X-Received: by 2002:a17:906:6408:: with SMTP id
	d8mr11393182ejm.185.1557533462408; 
	Fri, 10 May 2019 17:11:02 -0700 (PDT)
Received: from localhost ([185.92.221.13])
	by smtp.gmail.com with ESMTPSA id 65sm1819643edk.88.2019.05.10.17.10.58
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 10 May 2019 17:11:01 -0700 (PDT)
Date: Sat, 11 May 2019 00:10:56 +0000
From: Wei Yang <richard.weiyang@gmail.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Message-ID: <20190511001056.o3owpr3kll4unnic@master>
References: <20190419003053.8260-1-richardw.yang@linux.intel.com>
	<20190510212210.4ao2zoikky7jivwc@master>
	<20190510195932-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190510195932-mutt-send-email-mst@kernel.org>
User-Agent: NeoMutt/20170113 (1.7.2)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::542
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v4 0/6] Extract build_mcfg
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
Reply-To: Wei Yang <richard.weiyang@gmail.com>
Cc: yang.zhong@intel.com, peter.maydell@linaro.org, qemu-devel@nongnu.org,
	Wei Yang <richard.weiyang@gmail.com>, shannon.zhaosl@gmail.com,
	qemu-arm@nongnu.org, Wei Yang <richardw.yang@linux.intel.com>,
	imammedo@redhat.com, philmd@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SYrU/bINwcg7

On Fri, May 10, 2019 at 07:59:43PM -0400, Michael S. Tsirkin wrote:
>I merged this will send pull request soon.
>

Ah, Thanks :-)

-- 
Wei Yang
Help you, Help me
