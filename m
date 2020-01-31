Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp270178lfp;
        Thu, 30 Jan 2020 22:59:36 -0800 (PST)
X-Google-Smtp-Source: APXvYqxb0B5tDXJpnltIiFVxq7z3dmvwrdg0PIJ3RiuwwWRKgoZf5p6bs725evTDgbY/8Sg9ggOp
X-Received: by 2002:a05:620a:150e:: with SMTP id i14mr9217795qkk.273.1580453975949;
        Thu, 30 Jan 2020 22:59:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580453975; cv=none;
        d=google.com; s=arc-20160816;
        b=k0HmVxB69KRCFgod9ouKZaSNeGlWacnB3YJKeFf3ha9iTSA/Dquyb5F1WPAkfo5KMu
         LDS+W38oW8sB8YjcdyEyu79O+FhNSYhtU6bl2sgFu+EMPKeAjvinS6MitFa98rvy9jLj
         L35p6JiK7oRp0Yu6x9rcLYIrvJ+HwCk8sIMIspNHqikDxz4QyKkqtR2dFEQzMk/AXekT
         v+39iTI+ygXAf2AL+3Wk/1/QsGPzB0LR+yt9woc5o845osw5KiN61AfLAFbpCjBbXkne
         N/qdlRbpETeW26ob+0eK1ZLa2l7IHeFjAAxVbluswGgsm4LAUZOAsXyFkWtaaQ9zhuB3
         fqbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=KCttjTOypNyQ843GWrpw9fGXjQuWe6vFCW0vJ1KRroo=;
        b=n0XsiHjOb0l8LQKjsdIeENOwkweXqgaNWIQW+Kd5wA/5xyXfOYmfRhgM7+EZw6Tk1N
         Hdo6DiV8uLsxIj5/d1CaMyOKepxOx1ws7ukqqjzuooHBQG9O/6X/MJYJYgVLwe6Q2RFR
         n3BGdNWP/3sSIPD450muWq/0yptGHSwe22XhLXTGR60ZZ3wcotY1OwaUrWGekOF85cgz
         NHoYWrHiJ+zSeGWIbzHoXH9+YroPz/UcOaqtxKu/5SWkdoJhRcdATmEPLK88eHceYLSo
         Q2rG+Wr2gAElUTCMolqvtQYtSsEed+hXW7vYUm4eLlbljOQVkC4CWT4/pdwuVTKXPm2k
         Bu8Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=MHfWYHLO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q17si5888050qtn.40.2020.01.30.22.59.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 Jan 2020 22:59:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=MHfWYHLO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:49240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ixQH9-0007wL-Dx
	for alex.bennee@linaro.org; Fri, 31 Jan 2020 01:59:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46088)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gshan@redhat.com>) id 1ixQH2-0007w9-RO
 for qemu-arm@nongnu.org; Fri, 31 Jan 2020 01:59:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <gshan@redhat.com>) id 1ixQH0-00061v-G2
 for qemu-arm@nongnu.org; Fri, 31 Jan 2020 01:59:27 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:52479
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <gshan@redhat.com>) id 1ixQGz-000617-J0
 for qemu-arm@nongnu.org; Fri, 31 Jan 2020 01:59:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580453965;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KCttjTOypNyQ843GWrpw9fGXjQuWe6vFCW0vJ1KRroo=;
 b=MHfWYHLOhnAjkwiqYlrRt+uOO8En6GF0AGKVmL1ppJNlwcngK/dDY41ASm/8LewDUppqC1
 fGulxPw1egGFuKaZnPdLQcBEU33dIboEhavP+NIhsWUWc+AA5qsELW3nR+YxINbfdnYEJJ
 gb0X0wlgWw8QJgQZ93O2plD5azgqt9I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-126-NSxVcOdIN4y-afn7I4jV4A-1; Fri, 31 Jan 2020 01:59:20 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ED19610054E3;
 Fri, 31 Jan 2020 06:59:18 +0000 (UTC)
Received: from localhost.localdomain (vpn2-54-25.bne.redhat.com [10.64.54.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7873219C4F;
 Fri, 31 Jan 2020 06:59:13 +0000 (UTC)
Subject: Re: [RFC PATCH] hw/arm/virt: Support NMI injection
To: Marc Zyngier <maz@kernel.org>, Alexey Kardashevskiy <aik@ozlabs.ru>
References: <20191219040612.28431-1-gshan@redhat.com>
 <d972631d-7db7-b6d5-61b8-244ae2c85882@redhat.com>
 <7f6e29e6-1df9-4513-79ba-b53873b0735e@ozlabs.ru>
 <544f261e4b9c97f1d3a5fb64cef42ba5@kernel.org>
From: Gavin Shan <gshan@redhat.com>
Message-ID: <ff584722-1b51-e538-7c45-c71cdc40105f@redhat.com>
Date: Fri, 31 Jan 2020 17:59:10 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <544f261e4b9c97f1d3a5fb64cef42ba5@kernel.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: NSxVcOdIN4y-afn7I4jV4A-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=WINDOWS-1252; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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
Reply-To: Gavin Shan <gshan@redhat.com>
Cc: peter.maydell@linaro.org, drjones@redhat.com, jthierry@redhat.com,
 qemu-devel@nongnu.org, eric.auger@redhat.com, qemu-arm@nongnu.org,
 shan.gavin@gmail.com, pbonzini@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9n765AbqO2ZH

On 1/29/20 8:04 PM, Marc Zyngier wrote:
> On 2020-01-29 02:44, Alexey Kardashevskiy wrote:
>> On 28/01/2020 17:48, Gavin Shan wrote:
>>> but a NMI is injected
>>> through LAPIC on x86. So I'm not sure what architect (system reset on
>>> ppc or injecting NMI on x86) aarch64 should follow.
>>
>> I'd say whatever triggers in-kernel debugger or kdump but I am not
>> familiar with ARM at all :)
>=20
> All that is completely OS specific, and has no relation to the architectu=
re.
> As I mentioned in another part of the thread, the closest thing to this
> would be to implement SDEI together with an IMPDEF mechanism to enter it
> (or even generate a RAS error).
>=20
> On the other hand, SDEI is pretty horrible, and means either KVM or QEMU
> acting like a firmware for the guest. To say that I'm not keen is a massi=
ve
> understatement.
>=20
>  =A0=A0=A0=A0=A0=A0=A0 M.

Marc, could you please explain a bit about "IMPDEF mechanism"? I'm not sure=
 if
it means a non-standard SDEI event should be used, corresponding to the HMP=
/QMP
"nmi" command.

Also, If I'm correct, you agree that a crash dump should be triggered on ar=
m64
guest once HMP/QMP "nmi" command is issued? I also dig into SDEI a bit. It =
seems
the SDEI support in QEMU isn't upstream yet:


https://patchew.org/QEMU/20191105091056.9541-1-guoheyi@huawei.com/

Thanks,
Gavin


