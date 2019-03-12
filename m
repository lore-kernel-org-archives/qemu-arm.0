Received: by 2002:adf:fd4f:0:0:0:0:0 with SMTP id h15csp543769wrs;
        Tue, 12 Mar 2019 07:17:55 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy7fjSAt2o4iAIwjwcUXMDnr1nxSqt25mSThGCPFiCr8Ae+o39YBjFdoPgl8H/cIRxcA9HH
X-Received: by 2002:a81:6d55:: with SMTP id i82mr9925298ywc.178.1552400274999;
        Tue, 12 Mar 2019 07:17:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552400274; cv=none;
        d=google.com; s=arc-20160816;
        b=vxDkuFgfFVr2kqjjMjpNZjiaK4bV/fSL19Dt113A/bGhrMImrRL1bTlHp4ScdMHA6q
         mBnuCXhXXmlQfXdz8g78Duwt/ouUUjtdr59RF/kBD6IPVhBSGUPl3eHyL+OIjX1DSZUA
         ZP8so5C+4z096WFO0s1uhEWAwRwsbDzK5UmXjnt+aTrIPjgpI81ZPGHSsMnlk+FtN7SS
         V0AWUuWHTTPuToZSOjGROZezC4r0+yBpNVYatjBJC2zgTyMiCiRDKiq3sSvIjJzWtAX0
         CHNOmyDMSxNn+nZOEltQh3P2fGr4+k43tCEeoXdx4IE0IGmJEKwM2V7edo2oYOt4RmoE
         VBcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=I5cXIMsB5Bzw3l2j2rQDw1qx71XzcJpma2hrS6t0bbk=;
        b=LiYvWFM/+QyaQMPXk8U8nYpYCRChx+9Tn5wobh6SoeS9SUOcx35FvOxX0hjlk7YzvR
         5fqjzdt9a9g+qKZf5AQfAJ1eFuVJAyjGO4gOUNELvp/2f2oXK0eb6C1swtERqZqwYVWB
         izg7Xs/Ns/uP15nyl4OtljyFFy+ldY7noNUpXc1GUWXIfzrDLTtOM5MALbBAeqwUfjAy
         K/PO8MZCZO8juhRXFy6r2PvW35q9CHU0Jj1FvRvJL9sJO2u1HlV5omNc39hm/aL1e+xQ
         DqCvNjMx/xWfEdle9QnBkHUgbNbWYGegqYdO7mVvApgTyhseS4OVRPDWFuZhW5Q0iVia
         uu7A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v14si4788950ywv.173.2019.03.12.07.17.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 12 Mar 2019 07:17:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:53302 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h3iE6-0002as-Gh
	for alex.bennee@linaro.org; Tue, 12 Mar 2019 10:17:54 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37961)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1h3iDy-0002aM-To
	for qemu-arm@nongnu.org; Tue, 12 Mar 2019 10:17:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1h3iDy-0003S2-30
	for qemu-arm@nongnu.org; Tue, 12 Mar 2019 10:17:46 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58762)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lersek@redhat.com>)
	id 1h3iDx-0003RV-S5; Tue, 12 Mar 2019 10:17:46 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DA6D5C067C25;
	Tue, 12 Mar 2019 14:17:44 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-120-59.rdu2.redhat.com
	[10.10.120.59])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 001B460FB9;
	Tue, 12 Mar 2019 14:17:30 +0000 (UTC)
To: Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>
References: <20190308013222.12524-1-philmd@redhat.com>
	<20190308013222.12524-14-philmd@redhat.com>
	<0e007e09-cf54-312b-9563-59f3994209bf@redhat.com>
	<875zss3x8k.fsf@dusky.pond.sub.org>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <3a00b99f-85e7-c923-9218-3d2bc260e99f@redhat.com>
Date: Tue, 12 Mar 2019 15:17:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <875zss3x8k.fsf@dusky.pond.sub.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Tue, 12 Mar 2019 14:17:45 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 13/18] hw/nvram/fw_cfg: Add
 QMP 'info fw_cfg' command
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>, Richard Henderson <rth@twiddle.net>,
	=?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: h6w79cgEz96J

Hi Markus,

On 03/09/19 16:04, Markus Armbruster wrote:
> The subject "Add QMP 'info fw_cfg' command" misspells query-fw_cfg-item=
s
> :)
>=20
> Eric Blake <eblake@redhat.com> writes:
>=20
>> On 3/7/19 7:32 PM, Philippe Mathieu-Daud=C3=A9 wrote:

>>> +##
>>> +# @FirmwareConfigurationItem:
>>> +#
>>> +# Firmware Configuration (fw_cfg) item.
>>> +#
>>> +# @key: The uint16 selector key.
>>> +# @keyname: The stringified name if the selector refers to a well-kn=
own
>>> +#           numerically defined item.
>=20
> Ignorant questions, I'm afraid...
>=20
> What determines the possible values of @key?

the text file "docs/specs/fw_cfg.txt" explains this somewhat.

- In section "Selector (Control) Register", it lays out the structure of
the key space.

> What's the difference between a "well-known" and a "not well-known"
> value?  Examples?

- In section "Firmware Configuration Items", it explains the selectors
FW_CFG_SIGNATURE, FW_CFG_ID, FW_CFG_FILE_DIR.

- Then it "implies" readers should consult
"include/standard-headers/linux/qemu_fw_cfg.h". :)

All in all, a selector is "well known" if the QEMU source code defines
-- perhaps through incorporating a kernel include file -- a macro
directly for the numeric value of the selector key. Such a selector is
"well known" because guest firmware is allowed / required to refer
directly to the numeric value, rather than to look it up in the fw_cfg
file directory, by name (such as "etc/table-loader", "bootorder", ...).

Thanks!
Laszlo
