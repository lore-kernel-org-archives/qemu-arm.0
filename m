Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp2417005wrp;
        Mon, 23 Sep 2019 01:58:40 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy2WbfJnUXmpfRLMfGuA5Eu2csYpzzz8iysgRq6YOrKQQRk2p4pMqgNzxPoZXo1QGZ9dASr
X-Received: by 2002:a50:9f42:: with SMTP id b60mr36194807edf.192.1569229119992;
        Mon, 23 Sep 2019 01:58:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569229119; cv=none;
        d=google.com; s=arc-20160816;
        b=Gj3qJ7ndvkooMJE6/rGowZHiKFH75UxPcGOSvSsYx4ICK7B2YHTvk3cUtT/jtwUuX1
         V+UrMoKNfb9n/J5aGOqNrHB22N00eMUMm0n1DnMZJh37vB1T4NWBl6el4W5wWtnLd0OW
         x4ynMvys4RAIDrMqs+tc4fv69lXxOQ9LlfjYZRPUeLzv1FTy7deNB3+3lvC6a7k+ilmo
         40qAt1B8kzBEGXKv7f7F/k8XuiYHoqNQkNclgHIV+U6LsG6iLdxs6U9afTjEjCxTpL9e
         G6lxZNCH2gsuYCy9XhqFWz5JIZsa2w467JERsJDq9d74j35LCeEFa/amG+p6KbGiWKL3
         wvlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:openpgp:from:references:to:subject;
        bh=Urtrf/YKzPYDqmnteTSWNiGQzLl/ff7UnbYvOGrvomI=;
        b=DyIZ5QpLf6bJPOVGE4b/WfgT3JPhYbrfNBGuJc8UGhPVmbPg9YM4OsK0u4TNpblDtD
         wWhL4QOhTOiiAii1cz/9bIJz+3su9NtbN/BCaX02x8WfEsMntojyhzKXSxeYMs5Obyu1
         2HkCcFlVIAbUWJM9gO4hdpCGjhTDBf8gY8Kar+WSDVL2NrHWE0tCHzhYkt/J3FKFxEs1
         ZlV9umhrSUTk6DbKgrhc7XB24prd7nGNGBiWfXHGgm6jJm9QKgEYyXtzAFGa06vhBqlV
         0y7x/eQDW+d/XuTaYNWrgDagBxF2vYjBwgFiq2iyVJa7ZNAT3gINFc9OETiCc+M6WqHv
         sCPg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o2si252311ejm.367.2019.09.23.01.58.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Sep 2019 01:58:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:53904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iCKB3-0006rJ-VS
	for alex.bennee@linaro.org; Mon, 23 Sep 2019 04:58:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50951)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iCKAo-0006oz-2o
 for qemu-arm@nongnu.org; Mon, 23 Sep 2019 04:58:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iCKAl-0002ir-T6
 for qemu-arm@nongnu.org; Mon, 23 Sep 2019 04:58:21 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59002)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iCKAl-0002iS-KW
 for qemu-arm@nongnu.org; Mon, 23 Sep 2019 04:58:19 -0400
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id D1D5588306
 for <qemu-arm@nongnu.org>; Mon, 23 Sep 2019 08:58:18 +0000 (UTC)
Received: by mail-wr1-f69.google.com with SMTP id t11so4595794wrq.19
 for <qemu-arm@nongnu.org>; Mon, 23 Sep 2019 01:58:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=URrnnj7sUzJvV6cAwqpmdpic4G5LY5oWao01BbdCO/c=;
 b=JzxyFWeYRMLBne3gOiyjI1LAyRvYf5oKNGAkVDHUUTxFYKP/eHW8we6MW4SxxwY3Wd
 1rQU7NAIBS+H65zJzD36eX9tQB+1NW8w0U38FcF/lUe9unavvzLchQWpCaBRuqTyESto
 Zxp28q5HsfPu41Y6VWRnHTzUzxfic746j/aYpmmwfIzSebKLbkapD5+lGdXkBBpAvpKF
 MCOQIczVfv5rgIMsS7OgXxYFcu6Jm9Y2lzB/ASv7+a4ORVq85yQy52GM8O5E3duIqNWK
 Kl8M+f6uD80fwxmCoHALmC1K8Pg/+vLDyO6tjAFfRbPb2vr19SqsBLvJ4PW13PUn5seK
 o9ug==
X-Gm-Message-State: APjAAAXq5soa/SBxMHAKIWolpefXiXue1Mwsn5zcyXHz7FOK3MBIlicS
 Rb0ZepFt5HcxWid5Qg656WNi8e6MqEZ9xa/iP6MO8dNRCOJjdkVg/iKg8P0erw/yTdBNMAfM8zF
 p3/ldSBSDFy6X
X-Received: by 2002:a5d:6647:: with SMTP id f7mr20959129wrw.170.1569229097665; 
 Mon, 23 Sep 2019 01:58:17 -0700 (PDT)
X-Received: by 2002:a5d:6647:: with SMTP id f7mr20959110wrw.170.1569229097484; 
 Mon, 23 Sep 2019 01:58:17 -0700 (PDT)
Received: from [192.168.1.40] (240.red-88-21-68.staticip.rima-tde.net.
 [88.21.68.240])
 by smtp.gmail.com with ESMTPSA id q124sm19084259wma.5.2019.09.23.01.58.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Sep 2019 01:58:16 -0700 (PDT)
Subject: Re: [PATCH 0/4] Make it possible to compile with CONFIG_ARM_V7M=n
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
References: <20190921150420.30743-1-thuth@redhat.com>
 <faa7f493-6c40-a5ac-cc70-8cba6e016cb8@redhat.com>
 <11706c6f-a2e4-f181-208e-a7357e0c8d57@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <db702e08-5b0e-f225-1d79-62060e0260c3@redhat.com>
Date: Mon, 23 Sep 2019 10:58:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <11706c6f-a2e4-f181-208e-a7357e0c8d57@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org, Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xSjbqDeFyQvY

On 9/23/19 10:50 AM, Thomas Huth wrote:
> On 23/09/2019 10.37, Philippe Mathieu-Daud=C3=A9 wrote:
>> Hi Thomas,
>>
>> On 9/21/19 5:04 PM, Thomas Huth wrote:
>>> We've got CONFIG_ARM_V7M, but it currently can't be disabled.
>>> Here are some patches that should allow to disable the switch
>>> (if the corresponding boards are disabled, too).
>>
>> What about the ARMv4/v5/v6/v7r?
>=20
> We don't have config switches for these yet, do we? You started to
> introduce them in some of your TCG-disablement patches which are not
> merged yet, so that's something that should be addressed once they are
> merged, or directly in your series. Here, I wanted to provide you with
> these patches so that the arm_cpu_register() is available for your
> patches / later clean-up patches ... I mentioned that in the RFC cover
> letter
> (https://www.mail-archive.com/qemu-devel@nongnu.org/msg641907.html) but
> forgot to copy / update that paragraph for this cover letter here again=
 :-/

Oh OK, I thought it was a complete replacement of my series, now I
understand this only address the V7M case which is the sole switch
available as of today.

Thanks,

Phil.
