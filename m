Received: by 10.28.4.212 with SMTP id 203csp321008wme;
        Tue, 17 Apr 2018 22:51:44 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZoqR+9Z00dLrLBTJbXBI8UZRufBIcM+37eG8gvjJy7aDgOgzEkfRaWTkvHIqXS7FAkwKaA4
X-Received: by 2002:ac8:836:: with SMTP id u51-v6mr718611qth.407.1524030704038;
        Tue, 17 Apr 2018 22:51:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1524030704; cv=none;
        d=google.com; s=arc-20160816;
        b=h6DCPlNYuAdETZTURQm7rHkYSeJNWFSXGW+Nk+fp1nYhaLARjJZ+ewq/Hsq0DA/WfO
         mjXpwzgWKiJ7dAw/AS1I6ayO+Zhm4qVKdkQb6nc34WHYveaHMHs5boQ4ecnE6/lDXoPu
         Mly6BfWawPq8X1zqdhWztNuBY8MN8R2//tgpmp0loijQs3EbFN7fvxKis/71+f7Aktlh
         Ignj8BGpeVsFMw+G+g+5OOzt1tJn3lY+GDdWH53I1O4OvedXG+Yw8GJXkX3ATrePNxri
         NcTlZrEWGS0EJWLC6PNKqaV5o3AlqvBWGglOXsK4KVv3f6ocH1NGRfGMeL18gyY+Bbj/
         t/fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to
         :arc-authentication-results;
        bh=z6IgKrxp3FIYel2dSMQSmatDOY4AEg2XGbq5cwu+zJI=;
        b=Rve7/0+sjEISq0ZLVddcm/YWaAIL3PNN8ZJHHqybBx9R3/wXfUfDnV8i7kdToJszGR
         uLcjsWcmDC7Vzq21WzXhz/64ZndiO6jac5f1jIgSFdVYCATe41SqKe4k8NU0BJ/vTcrm
         v3PNAgAV1EM0Sg/wi7QPJrTty1rGH181kT/TO6zN8yYuI4c82wpQyn7exqeKZ67bGi+p
         DYy8/7hHtCRlu2Tay9TcfWO9KvbhkvJWQTUqgxt5bqcqctFa9UYEFul1wh2eUntR1I6k
         4UWY/o43+l+1QQGkWx131W1X3M8w78xxwcjst0GcSFWfYoXNu+wOTc1mOCTOMRb4XUuI
         16fQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n8-v6si653183qte.323.2018.04.17.22.51.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 17 Apr 2018 22:51:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:60572 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f8g0N-0005HG-IT
	for alex.bennee@linaro.org; Wed, 18 Apr 2018 01:51:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54244)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <th.huth@gmail.com>) id 1f8g07-0005Fc-7U
	for qemu-arm@nongnu.org; Wed, 18 Apr 2018 01:51:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <th.huth@gmail.com>) id 1f8g06-0000ji-EK
	for qemu-arm@nongnu.org; Wed, 18 Apr 2018 01:51:27 -0400
Received: from mail-wr0-f194.google.com ([209.85.128.194]:33232)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <th.huth@gmail.com>)
	id 1f8g01-0000eQ-Vz; Wed, 18 Apr 2018 01:51:22 -0400
Received: by mail-wr0-f194.google.com with SMTP id z73-v6so1264871wrb.0;
	Tue, 17 Apr 2018 22:51:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:cc:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=z6IgKrxp3FIYel2dSMQSmatDOY4AEg2XGbq5cwu+zJI=;
	b=J/0MV0y78AlT/MpcT9M7d/gmtxWlGHxlbwzSosT7jaksMI7sYi6AQ3rZDVN3vIY7sV
	wcXOEJWjbyAmO6EMoPv2FcEffCOgiag52TCmfUsJKqicBYlCwc43x/X43G1i30/NUKOa
	cznD/tlroSNTyY7Hf0Asbln4SGa/MdCdTQqfbydlxa76AxsDpf3BxCxlRiNMcIStQagj
	NV2/wcaF1nw9OyNYQH/GKba9AB7Wz/ffvJ8D+65H6NKATQYKcIpH2Nc+hMOjZfuGpheR
	iT1RFmQ/+3wwAdjmxPF76jCzIgOkYg4hGpxeLsmMDMChGaanmxgLM0eBd303lxs3vu+V
	cu5w==
X-Gm-Message-State: ALQs6tCQ196jpaHMiCxGcPZMcwzwcOydR18lNgLUG71kzum9rbFhPKhH
	QCrgMIRybS9/2IBHYYj41S8=
X-Received: by 10.80.142.131 with SMTP id w3mr1381994edw.140.1524030680582;
	Tue, 17 Apr 2018 22:51:20 -0700 (PDT)
Received: from [192.168.178.23] (pD9575805.dip0.t-ipconnect.de. [217.87.88.5])
	by smtp.gmail.com with ESMTPSA id
	v40sm416360edm.35.2018.04.17.22.51.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 17 Apr 2018 22:51:19 -0700 (PDT)
To: Henry Wertz <hwertz10@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
References: <CAOuPqTF3nG157ShF-hW+poXbr25zODOz8pj+o9XdY=ZgU8qpFQ@mail.gmail.com>
From: Thomas Huth <huth@tuxfamily.org>
Message-ID: <81f19d71-d226-29f8-42f8-47f28160289e@tuxfamily.org>
Date: Wed, 18 Apr 2018 07:51:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <CAOuPqTF3nG157ShF-hW+poXbr25zODOz8pj+o9XdY=ZgU8qpFQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.194
Subject: Re: [Qemu-arm] [Qemu-devel] getdents patch for 64-bit app on 32-bit
 host
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
Cc: Riku Voipio <riku.voipio@iki.fi>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: apRCuKN7q0+h

On 17.04.2018 23:53, Henry Wertz wrote:
> Please find submitted a patch for getdents (this system call stands for
> "get directory entries", it is passed a file descriptor pointing to a
> directory and returns a struct with info on the entries in that
> directory.)  This patch is against qemu-2.10 series but continues to apply
> cleanly on current as of April 15 2018.

 Hi,

thanks for the patch, but when you send patches, please make sure:

1) To send "unified" patches, i.e. "diff -u", or even better, use "git
format-patch" to create it and "git send-email" to send it to the list.

2) Patches should be inline, not in an attachment

3) Patch description should be ready for the changelog, i.e. don't write
something like "Please find submitted..." in the patch description. You
can write additional text below the "---" separator if necessary.
Patches will be applied with "git am", and text below the "---"
separator will then be discarded.

4) Make sure that you put the right maintainers on CC:, or otherwise
your patch might be lost in the high traffic of the qemu-devel mailing
list. Use the MAINTAINERS or the scripts/get_maintainers.pl script to
find out the right maintainers.

Please also see https://wiki.qemu.org/Contribute/SubmitAPatch for some
more details.

 Thomas
