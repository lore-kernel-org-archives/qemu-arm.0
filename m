Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp386664wrg;
        Mon, 20 May 2019 09:42:15 -0700 (PDT)
X-Google-Smtp-Source: APXvYqw79TbgoGd0dZ2WPqXgqZeFBT1jT5CSfU2hzBr7RZ4919RhVladilRFXDyQJs3WUTx09Ghv
X-Received: by 2002:a50:b68b:: with SMTP id d11mr76609184ede.42.1558370535072;
        Mon, 20 May 2019 09:42:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1558370535; cv=none;
        d=google.com; s=arc-20160816;
        b=VzoqbrX2yX2ezzmcUeBF7IXTmBgImNhIPmt76loy1kdf6PXLXcEqYFWUrZvfpg2WQh
         4WKRU8a2jmZvWpbXhjD3qsBZ0U/9xSKkQxqSUEcCsrQ3H/sflQOeKoBrRIHLYgjz9S9+
         pY61ZnjjsmZVvuny1RSzyo3MnQ0fxlGZZvYa6IfSP6glDXUDqupKVPEI/p3ERXlQ3WfA
         zoAc2WUr+be7IQbacVAQCvFgmsSj3YKlR/hLK6GslZcox87I8jxp7i0fmQo8Kl/80QFo
         8O4xOSy8Zh2J1s/YnlR4pTBnUVqlwK/k1ToXpk5l0VVuj2kMBBi3aSfqJ/XXLCmZkGqx
         NPIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=pcrhVnfZkqq9nUYBJVJooopGSz92F5BjMRVaz91OSog=;
        b=pmZFY30zVzlncN79aLRE4nDqOYuWWLM+qUyHjKO56hWIapurtvKtRNUgJqpkH/Xsea
         y05kV605JRlklBYPOVWeMcKQ/we0prTCJtAYEjF/mBj7UfjIvlyYQfJrzJUqGbRNdfH4
         0v7zlofQVLblSIjoXxplHL/cddTuGry814p1wtsQ12ohzfrMunvZVUc7daX2mRVypdND
         E4F8DloR+36mXeaBeOj9AIUmYmiKIdVX9NSSZ5QTAsdFgnYYz6TqwKTmPg6jr/7Th3Ix
         eeMClqgPka6+kE5S+Zn2ja0X2g5YJU/azKVI5DlE1MotzWif4iBxHzPaS1F+q4oT3bI+
         RcTQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c13si2312639eda.389.2019.05.20.09.42.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 20 May 2019 09:42:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:38432 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hSlMc-0005cD-3O
	for alex.bennee@linaro.org; Mon, 20 May 2019 12:42:14 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44452)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hSlDR-0006c0-7r
	for qemu-arm@nongnu.org; Mon, 20 May 2019 12:32:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hSlDQ-0003Qz-C3
	for qemu-arm@nongnu.org; Mon, 20 May 2019 12:32:45 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:39954)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hSlDQ-0003Qf-5J
	for qemu-arm@nongnu.org; Mon, 20 May 2019 12:32:44 -0400
Received: by mail-wm1-f65.google.com with SMTP id 15so9649536wmg.5
	for <qemu-arm@nongnu.org>; Mon, 20 May 2019 09:32:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=pcrhVnfZkqq9nUYBJVJooopGSz92F5BjMRVaz91OSog=;
	b=gjaWClYp6xQkZGMfs5IONs8Pe7izbNrHBHbXVXWLQUfUDL+o6H/ifE5FcRUKl33HhS
	litaaKBotA14ZYffmobCli7dSe+4mWSEUqsOjXj+S/3sDwDShZQYOti1vIJh5BPYuH2+
	/cWi4JBGPytc7pIkuNds/ehAamA8nhHB66TGmM9ZzNqEOTuLgXVBbt4dHgBwWvPhLx4l
	Ph5k9JeRXPqyCkSzTnSJWGj/bE8A0nUEnRU06M0dWqM3TZCN6B9EulOi+t+NDtSqXn0B
	E24tM1qQFbJiuv03kwERSxUxExfgVTBGvbTI4BW8XuCwV7g48KVW0AsC5zbBkh7lEqZB
	l2LQ==
X-Gm-Message-State: APjAAAUJBqjAgOdG/6DWyPEcHo8RhroC54Sm4lYwsG1B+ZMiod+e4Sgf
	qfEXqOJLcVFcv6+kFjnc5/+MAA==
X-Received: by 2002:a1c:d182:: with SMTP id i124mr20676wmg.102.1558369963167; 
	Mon, 20 May 2019 09:32:43 -0700 (PDT)
Received: from [192.168.1.43] (228.red-83-52-173.dynamicip.rima-tde.net.
	[83.52.173.228])
	by smtp.gmail.com with ESMTPSA id t15sm28072wmt.2.2019.05.20.09.32.42
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 May 2019 09:32:42 -0700 (PDT)
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
	Peter Maydell <peter.maydell@linaro.org>
References: <20190506142042.28096-1-clg@kaod.org>
	<b12201c8-7d5f-2108-6666-75543c38f243@kaod.org>
	<f1ca56fd-c83d-8ad6-29c9-a8fc6af4531c@redhat.com>
	<270e510b-687a-6b43-8cd6-c1eb1aea41e6@kaod.org>
	<6161d982-0d21-99d6-680a-37ae300fd7cd@kaod.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <98d1e57f-c033-fdb4-51bd-4a6fc2223d58@redhat.com>
Date: Mon, 20 May 2019 18:32:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <6161d982-0d21-99d6-680a-37ae300fd7cd@kaod.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.65
Subject: Re: [Qemu-arm] [PATCH v2 0/3] aspeed: cleanups and extensions
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>,
	Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XUqPqYRwtXOg

On 5/20/19 3:32 PM, Cédric Le Goater wrote:
>> Peter, 
>>
>> do you want me to resend with only the two first patches and include 
>> Joel's in the same series ? I would leave out the part Philippe is 
>> covering in his object_initialize_child() patchset.
> 
> Nope, we can not do that, conflicts arise. I suppose the easier is wait
> for Philippe's patchset to be merged and then rebase.

Eduardo said he'll send a pull request during the week.
