Received: by 10.223.172.38 with SMTP id v35csp2738137wrc;
        Mon, 25 Sep 2017 11:24:10 -0700 (PDT)
X-Received: by 10.237.62.200 with SMTP id o8mr12322930qtf.294.1506363850373;
        Mon, 25 Sep 2017 11:24:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1506363850; cv=none;
        d=google.com; s=arc-20160816;
        b=L0vCJt+vtCmozwhz3hdaNqJTZpVOcgRsa4UxEWs9EQAJZ15Vg4mcJuJ0xANhgtEYV+
         LM9d9S9SGByqWV4g9LhBMKFsH54415kc0QoXucja+KpWp16x6UoQJ8YCkZognJQfTCjH
         2bTFsJLo7YKf7l1FTfcW9cXfVUq0GocwntkYCO7Yg7ZltuYzGjqkLCez2WwvY47mfqgn
         gPlqudaep6Il+9dXjjHENK0Wmjw/lt6ktf7dt8ev1VT1s9RDLdHkWBu3LlQ6hddKwVpR
         7BnSb/VSNCJEtAc4+9TcKqjKXZNa7cnzkAttqH66GdPp+tqwuMpptnRND8I37AHvJwBH
         WvMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=OclQRIaj9y2Yu8pWBuECvrAT0cPK02Ur6VLkSOWwig8=;
        b=on0JfHrfkizxmSoCzA1oC97JejlEKTKpV+oqml1WYu9T6NDfibX+CLe2pvfGtasqK+
         qpbvgglEsBMLL6X/0wdew91wZk74LXPb2k0lZpWjWxibpUi04Ph8BDm13BF3LmfrDJ7c
         rJTNAgKCXwqXvwQ/3DkJTcE7apMjKi//XQNPCFB0/OAqP+s4doT5pyresVJddYvoPlHg
         wl9MT3yUXTykHnFeyzrMqp9XNQIxySK46JFwIf68HeATFiz8yCAZNPUiQ57UL13b2Jq1
         O9opywtT5xI8uYTNio0QJR0fYa4hPBrwMgyB7HZ2StSXQMCyzqakudY0sa9x9iyl22tg
         T/Lw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=WNMjyXTT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n70si6530422qkl.107.2017.09.25.11.24.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 25 Sep 2017 11:24:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=WNMjyXTT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:43768 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dwY36-00067Y-4I
	for alex.bennee@linaro.org; Mon, 25 Sep 2017 14:24:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53404)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1dwY2x-00067G-0V
	for qemu-arm@nongnu.org; Mon, 25 Sep 2017 14:23:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1dwY2w-0003XD-83
	for qemu-arm@nongnu.org; Mon, 25 Sep 2017 14:23:59 -0400
Received: from mail-qk0-x241.google.com ([2607:f8b0:400d:c09::241]:38790)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <andrew.smirnov@gmail.com>)
	id 1dwY2w-0003X8-3L; Mon, 25 Sep 2017 14:23:58 -0400
Received: by mail-qk0-x241.google.com with SMTP id c69so5357084qke.5;
	Mon, 25 Sep 2017 11:23:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=OclQRIaj9y2Yu8pWBuECvrAT0cPK02Ur6VLkSOWwig8=;
	b=WNMjyXTTRoNRIrTNSlwK+tFfGiukf4HlzyNj7u3obBf4DbwnFrJUWGk3dJhXgjIFwX
	tB6dxEmovKsRnBHv3H9XnA1P2vFX7ir5Z+/vT2S6gnal5/Dr97iOIOYZO40oGbYuPURt
	k859tYhCpJbWxCYOQ2eniAAwHqrAXwowr+1vt8YDz1O7zLBqsIPhCrOhQr6lS2Ir8/kh
	n0eWT8F2C5k9YLGBOXjFBVmCJYiFSdZVpHHVvrAUC/39HyW4bcEAG9D9RRz5mna7DHjt
	Zjv07lPDhFolRfMkQQI2AMK6+ZlUbMf5/l1Rbo9R9g1wXxk1lLj4804AipAKmLK4ul4O
	Y/Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=OclQRIaj9y2Yu8pWBuECvrAT0cPK02Ur6VLkSOWwig8=;
	b=Cj3zfWlPV6Gq7iKW3SmRuCR3+e+xH4xMbclKCjfTHkpHpl8atdh2OvVp8T6tZqC/q3
	T3u8zxzDgDPMYEI8KNrDovfZUVQ+32FKodk+t16uZtQAbTIJWfx6W9WwlaAhjXGMR4OC
	AVVdcqJqhi//WrV2Zhbu/W2xp/rpb3DzieGSZ9+veWCES0NjuUlAjBN/R60xweLu5kLE
	QjGDb07wOGXrlC+GxASuT1JLPz1DNfnMoPjvdmnjo160KeKQtD6FiZRuvup9AnegJAEg
	FG07tINagfzZGuutiIBtQL5bcE0ZAOnbxbraWao+804MbNjniWl1aF8Bd4Pioqge7xNk
	mB/A==
X-Gm-Message-State: AHPjjUixtz5u/EVqZ0m74nGg2NJj6XMCZexytORaNYbTnKlruL1r04jU
	keNHEP4BNYaoymVNDux8mMXAhBiUUf2QsW35+sU=
X-Google-Smtp-Source: AOwi7QCtple89kGRQv20g2NS+ykAQureZXv8yHAJsbZQIau529WlvK3NkBUA+Ctyky4bsUX2bQHIQeaheq/PO9WS77o=
X-Received: by 10.233.232.13 with SMTP id a13mr11592259qkg.83.1506363837380;
	Mon, 25 Sep 2017 11:23:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.23.116 with HTTP; Mon, 25 Sep 2017 11:23:56 -0700 (PDT)
In-Reply-To: <10a9c31a-5bd1-5915-4b82-1c3cf9cd8bbd@redhat.com>
References: <20170918195100.17593-1-andrew.smirnov@gmail.com>
	<20170918195100.17593-9-andrew.smirnov@gmail.com>
	<10a9c31a-5bd1-5915-4b82-1c3cf9cd8bbd@redhat.com>
From: Andrey Smirnov <andrew.smirnov@gmail.com>
Date: Mon, 25 Sep 2017 11:23:56 -0700
Message-ID: <CAHQ1cqHdsmA4zRBh7=VHU8v5Xn1K+D2bsOWkQivs7iuOw7GRBA@mail.gmail.com>
To: Jason Wang <jasowang@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::241
Subject: Re: [Qemu-arm] [PATCH 08/17] imx_fec: Add support for multiple Tx
 DMA rings
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	"open list:ARM" <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Andrey Yurovsky <yurovsky@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pTs+yztUiPzS

On Fri, Sep 22, 2017 at 12:33 AM, Jason Wang <jasowang@redhat.com> wrote:
>
>
> On 2017=E5=B9=B409=E6=9C=8819=E6=97=A5 03:50, Andrey Smirnov wrote:
>>
>> More recent version of the IP block support more than one Tx DMA ring,
>> so add the code implementing that feature.
>>
>> Cc: Peter Maydell<peter.maydell@linaro.org>
>> Cc: Jason Wang<jasowang@redhat.com>
>> Cc:qemu-devel@nongnu.org
>> Cc:qemu-arm@nongnu.org
>> Cc:yurovsky@gmail.com
>> Signed-off-by: Andrey Smirnov<andrew.smirnov@gmail.com>
>> ---
>>   hw/net/imx_fec.c         | 97
>> +++++++++++++++++++++++++++++++++++++++---------
>>   include/hw/net/imx_fec.h | 23 +++++++++++-
>>   2 files changed, 101 insertions(+), 19 deletions(-)
>
>
> Is there a register for driver to know about the version? (Looks like I
> didn't find it).

I haven't seen anything of the sort in the datasheet and, since Linux
driver relies on DT for that information, I am inclined to think
there's none.

Thanks,
Andrey Smirnov
