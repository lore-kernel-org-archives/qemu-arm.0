Received: by 2002:adf:fb8f:0:0:0:0:0 with SMTP id a15csp7274846wrr;
        Fri, 15 Nov 2019 12:14:13 -0800 (PST)
X-Google-Smtp-Source: APXvYqyKPqhdG6G8sPl6uE7rVKBGIduUzMncsF6l0MMU9CBl3IrODLSyB8YG2EbxhRmTiKNMpiQv
X-Received: by 2002:ac8:703:: with SMTP id g3mr11834979qth.225.1573848853253;
        Fri, 15 Nov 2019 12:14:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1573848853; cv=none;
        d=google.com; s=arc-20160816;
        b=Pej56lsJkNBI7dHLMkOGf4uFpUKY1hPu+JVvRBTHqVXnI9cTzIfytQbYyk2vJw9Dbk
         FgpiFKIssPPvz1d9yiJXBeabaqs2Ejmgnsf6YdwNoMkRpR4BK8IPCx5HQlXmQDAoo6cp
         vMGnJ1o5v9UZHbA3KJteUB6KcvGgNG0dibtQw+tPk8DyzwCHQ67Ft4cWcChDRIymkk4h
         XnmjR6qfKpRLX6dBGdtcGgb2oU7/+1WWLcuLkAKgg3NpA8vDj7249AoMp8gOfu7pfp7s
         i8lAXu2uNWmznT9NhjBUkIdpz9rdVitMc3o3CBqN2xkOO3hTJBDLxLKJ5suxNEEQeKYW
         voQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=WcWiT6IJUFWyy7j3i2JUztrqelJ43IUFT+I9NhbDR4E=;
        b=YCirbJnIz24DdpEIiYZpZvOy0n3aSz+p273YbyOQRMf68uiZI2GCZ259BALRacFoYh
         TCvdRTUJgf0rgz0HEdcGW0zzGQiCWomHuCpff8P05L0oW9hnNE4PRy39/jRklDCvG29w
         G6hzzK82PE60E0CS1OEfj7WZz3z9c/D4xlJqsy9wszFkioCcuXdD/oFXIAJzKr6qQXsy
         XfVLt9jmQqi0Y7c60APjcEPtz2lZ9WLs+vlE+n5OfGtOuK3wrQcJqwBpEJpIUxVK8T8p
         /cOeD9PPiiefypAQtliesxEI76HQ8XKj4SkraRrOKdV+INKI4OlPbBQ+L//1FlQTTjeA
         W4UA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Tl5uXJkR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r143si6557932qke.188.2019.11.15.12.14.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 15 Nov 2019 12:14:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Tl5uXJkR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iVhyu-000731-Nk
	for alex.bennee@linaro.org; Fri, 15 Nov 2019 15:14:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41720)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iVhyg-00071U-00
 for qemu-arm@nongnu.org; Fri, 15 Nov 2019 15:13:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iVhye-0005Z8-T5
 for qemu-arm@nongnu.org; Fri, 15 Nov 2019 15:13:57 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:57219
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iVhye-0005Yq-Px
 for qemu-arm@nongnu.org; Fri, 15 Nov 2019 15:13:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1573848836;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WcWiT6IJUFWyy7j3i2JUztrqelJ43IUFT+I9NhbDR4E=;
 b=Tl5uXJkRsu6Ge0EshRpn0pAlF8hYsVQWipUzuF159RdxQ77WUIe96X2JrEtkiZFXA4ceun
 76ENAbXojZ7pfe0+x3XGekX4Dfs6SGa3EaMKzmsZsSiWIVu+WvzVXSKcS/wUjUlQu3z80f
 J6N/Z4WkwF1Cdt0RpRgMBUt4B9X+nhM=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-409-fYx1v5EMMI6p03eNFutVsg-1; Fri, 15 Nov 2019 15:13:52 -0500
Received: by mail-wm1-f69.google.com with SMTP id i23so6838864wmb.3
 for <qemu-arm@nongnu.org>; Fri, 15 Nov 2019 12:13:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jSk6MSXrMTuD+6d5TS7RieuJpLzq0JDmRMZu+Z7y0h0=;
 b=oDY4RfAkaTG+K3bURqDuOASiJ0+f/eD5NdxQu8MDUVFx3t44E43mXy/wyU+z3Eq98f
 AtHaIfXaMfwRk1NdF0wO036HvbQwj3+scUIMSk4sOxYVLp00AHXFz7zjQ9IqE12qGrc3
 oSirLtFjhblGc3qp43lwQjKn3xBG7ZC9sJ+hqj8YS4fYl3/z+X1sxBug0pKkctQXT1wW
 1L6GCcT4VXbQSjEIQ8iIkA5rBsy2e+xoAxSJzi2u9b0adRMEAbg4PNXd6f7c6nLD33s+
 J60XuzspB3nDTis47NN6irLpzMzfVbtWV5N2nA/ROm1NqSIPrACVkVgugI7e+1rl22Se
 iYog==
X-Gm-Message-State: APjAAAWeBiYpet7paEemZxFiZy/RO0q9x9RPy51yr2+rFv2hzaNLC1Zx
 NOcAll/JBUp4aKubO7EVFKGf0g6yQkcv8UlZ1P477dN5Kez3mDpZFwhBpzX1xuzygRLk91teEC7
 FqyRTIs0tjq8/
X-Received: by 2002:a05:600c:20e:: with SMTP id
 14mr16118025wmi.107.1573848831839; 
 Fri, 15 Nov 2019 12:13:51 -0800 (PST)
X-Received: by 2002:a05:600c:20e:: with SMTP id
 14mr16117987wmi.107.1573848831641; 
 Fri, 15 Nov 2019 12:13:51 -0800 (PST)
Received: from [192.168.1.35] (170.red-83-59-162.dynamicip.rima-tde.net.
 [83.59.162.170])
 by smtp.gmail.com with ESMTPSA id a15sm3045352wrx.81.2019.11.15.12.13.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Nov 2019 12:13:51 -0800 (PST)
Subject: Re: [PATCH v1 0/1] hw/arm: versal: Add the CRP as unimplemented
To: qemu-devel@nongnu.org, no-reply@patchew.org, edgar.iglesias@gmail.com
References: <157384151968.4715.3538455192633139890@37313f22b938>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <f524f24a-1655-5234-4b67-0830c84fa262@redhat.com>
Date: Fri, 15 Nov 2019 21:13:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <157384151968.4715.3538455192633139890@37313f22b938>
Content-Language: en-US
X-MC-Unique: fYx1v5EMMI6p03eNFutVsg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: figlesia@xilinx.com, peter.maydell@linaro.org, edgar.iglesias@xilinx.com,
 sai.pavan.boddu@xilinx.com, frasse.iglesias@gmail.com, alistair@alistair23.me,
 richard.henderson@linaro.org, frederic.konrad@adacore.com,
 sstabellini@kernel.org, qemu-arm@nongnu.org, luc.michel@greensocs.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rOW2LJLEMSSv

On 11/15/19 7:12 PM, no-reply@patchew.org wrote:
> Patchew URL: https://patchew.org/QEMU/20191115154734.26449-1-edgar.iglesi=
as@gmail.com/
> =20
> This series failed the docker-quick@centos7 build test. Please find the t=
esting commands and
> their output below. If you have Docker installed, you can probably reprod=
uce it
> locally.
>=20
[...]
> The full log is available at
> http://patchew.org/logs/20191115154734.26449-1-edgar.iglesias@gmail.com/t=
esting.docker-quick@centos7/?type=3Dmessage.

Unrelated error:

 From https://github.com/patchew-project/qemu
  * [new tag]=20
patchew/20191115154734.26449-1-edgar.iglesias@gmail.com ->=20
patchew/20191115154734.26449-1-edgar.iglesias@gmail.com
fatal: failed to write ref-pack file
fatal: The remote end hung up unexpectedly

