Received: by 2002:a19:f807:0:0:0:0:0 with SMTP id a7csp2251550lff;
        Mon, 14 Jun 2021 12:24:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy8L8ZUlIELkxR2yE3Rer9hl2zp1ifIL5TQFzzQu330OwNcNGKf1k01fAiXLg3H25uakhct
X-Received: by 2002:adf:a353:: with SMTP id d19mr20806289wrb.363.1623698648609;
        Mon, 14 Jun 2021 12:24:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623698648; cv=none;
        d=google.com; s=arc-20160816;
        b=QZe98FDDw3B6gMTBxzWXc8Buxjj15YOf5zapADUPhP+/JogHpcOUP+Erq61yrXoWuC
         ALiT7IiKbxSWqdIdNfMNHf6Y9LSxkHEhA1Zv604M/o0zmFJvH0NafPPtFiADfTUB5pn7
         0HoDlpM9hNPpfFHr2rYmaqPs/h2cgwdQODqbTZVCafz8Wfljf9pZ050/nfkLOe4D0+YW
         rcllxHSyCZcUwqrO+SJWIezb1KM1c2GqWlc0A8DRTi0q9Z/6ywjRZecT4oEibJz5lSzw
         75amQcxeY+wyCz5LISYLUhgvMZkv34tYyZHC03oRzxc+cbGrAKbsF65iQQVAIg9N8STt
         SABg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=Xxfyjh/rP2/7esx3Z4qpFg/m4qDvSwPg6Jbr0r31hiU=;
        b=Q9DyBLLXt6QfLRyY4WLlJGGQusbMdZdUHi5sxUd7JHNACbX7LPbnL2k5NQ2FyPMZDO
         DKMDk6yU+KTDmLJzlfcltNjPwWXMLfNTORm7i8beHgiiuPDOmyrwmHeK8wM7fE8hgM2K
         VX7c+2Ky9jpx2f4nbZcGDbIkUhymhngyrI+Hj9CcBkGqICZ86yEn8NVCEDOcHOAd+jOj
         QRbcuCGCOvj6YrhUXrpRNLf4gw5j/2zfc7WCWT4x6CbrmcIPaz+HcB0rNP02ejqPih47
         2rKwi7etqfjESS7jn9+t6+E/f7WTUJhwo1AXFfN5Ov+Lf27MNC/d+ZrR64XTkkQlrwXh
         0StA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmx.net header.s=badeba3b8450 header.b=je2+k5MY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmx.de
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k20si425728wms.165.2021.06.14.12.24.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 14 Jun 2021 12:24:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmx.net header.s=badeba3b8450 header.b=je2+k5MY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmx.de
Received: from localhost ([::1]:58650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lssBr-0003TG-DK
	for alex.bennee@linaro.org; Mon, 14 Jun 2021 15:24:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xypron.glpk@gmx.de>)
 id 1lssB9-0002aK-Kq; Mon, 14 Jun 2021 15:23:23 -0400
Received: from mout.gmx.net ([212.227.17.20]:42959)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xypron.glpk@gmx.de>)
 id 1lssB7-0007X6-0W; Mon, 14 Jun 2021 15:23:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1623698591;
 bh=Xxfyjh/rP2/7esx3Z4qpFg/m4qDvSwPg6Jbr0r31hiU=;
 h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
 b=je2+k5MYN48hQnlfoheVwA+ytCkCeyficNu4SghWFLxFlkUbJ5LtVr7CnZem1RKTV
 wBN9X9dS4WY7aTZMLQ0by0eQKp7CU1iUSl07x688H6J87Gj+Ce5X4/0+tCHpIZEPWc
 WTkeCSg00kh/xOVzXrAGZBtLsoL6ngV3TgMJ27s4=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.123.35] ([62.143.247.63]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M9Wyy-1lwBYZ0ocO-005Wlt; Mon, 14
 Jun 2021 21:23:11 +0200
Subject: Re: [PATCH v2 3/3] hw/nvme: default for namespace EUI-64
To: Klaus Jensen <its@irrelevant.dk>
References: <20210611234631.81314-1-xypron.glpk@gmx.de>
 <20210611234631.81314-4-xypron.glpk@gmx.de>
 <YMege+mwy768d/Uk@apples.localdomain>
From: Heinrich Schuchardt <xypron.glpk@gmx.de>
Message-ID: <d20f88a5-9fe2-3f8f-5251-5379854afc87@gmx.de>
Date: Mon, 14 Jun 2021 21:23:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YMege+mwy768d/Uk@apples.localdomain>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:3+V50cx62amvgvNCosmbuGtzhgIzj+c9bXJwzi9raM2g6h2wLWK
 tcObtFkBxeEQaxzC42QfgE3Sk3zIZYqN3ugm6b8JQf7gOHeojf1bVBoQAHk0RBdF/gOj2Xl
 93VqZ+88i4cyZxERXmmyb0HRjhcoB+3lG9JKI5XJxf9xW3EuwQP/nwtr3LIjYN4PM+keWlq
 gcdwvJfH8D16AB9CsPZXg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:RymcIDWtdxw=:ZpQuvPQoHPbyXMFLVfkLnh
 0cs5fUd/B/zMQ3EhYHxFIMw9OAFpoOUywezSp7+AiqK2yMaYH42NunYsmaRcev8hnkRpdUhA/
 BOttlbo82Q3JAz+d3rZVym3HvQ4TYyCu4NxB5+6R9Iv4wRglZSzCGyAy6MMNvBLlsGmNIn1AJ
 bEvXrGS0hQ+POCS6CHmfV2k65Hh7nMsfR2ls79wh4xzcVCkQZxAracyQLSYb1YpoXsRuXiMeY
 gAp0WVVoVwseGafKagUlIPCXcMxONpwNsfXyBghio8Nip/IJaMz8JEfkS6IXlHo6hkVsTO9MJ
 cj+LGdtcxfL+SVhO1SrwMRQpMdEMzbDC/mFg9xHipz5r0fRF/+HCQ7EYnP/F/CBshn7gOBEks
 dvuLyTgFHPdOBlOySvyIpV9UtJ6cTf8oL1KNBUjQJ/oriInXSUZXRu+12/vxsQv90wzE30ual
 EAC4qgsv1rjPO4Ea62gfZ98u17ZiQl4YUXsXw63YYUc/C5oI+0cUxoRI6Vzi/r5RVu7NNEEVN
 XkwQj0gK8kpXraFNpHjhJiPMqIb9R4FpsmxiiFATqSE/fxXz8JAIJqyNFGTwADeZaKl6YaBtH
 dMC4OkOncOz1cDyJEOAV7VHn544lt44c2sgGlR3ylfH59vATlHv6ziLFyKDviaRjgbx5hbKzD
 ZqsAyq0Fy9tP/G7sGNQ0tc6HfEa8ld8xcMfZzZx8fRrZyAAWmiAU9/C9e+GFNxghdkZqJkthV
 ky5sMlDWR1wEbLLhWwp4outEG9oNOlbrxGueUiBKuXfzJFTKP2Yk0LA2q5lRa94Xg8aOo3gS+
 063nwlUEYs/gMQOqFwVFCwD52kd8T/iTCnaqTgRSw6eve0g7TFEjG2Sffc3/7rrsuQIJp28JP
 yVWx0A7v2f8fNeh1bAg945ZfoOAyiDF7xpqGYJqt3LaLTrB1mc543zohC+Wm0Ik/nNYjZq2lf
 BX+yDrNixeTWTAB3/XyR1zy3QAinzjL9ERoB3KGy1/lfxyYVAbmlovGVHkgP+LYjIdrZa4nOf
 iIZMG1x0XkDi2KOBhzMNU155J1xcsYE2K4rYyyWwCqAL6+9EmjzToCLz7KNp+rPOauDqgaMBG
 MksiiV9uPjGSuukRaGxNhnrBrGJexGgRwDL
Received-SPF: pass client-ip=212.227.17.20; envelope-from=xypron.glpk@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.489,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Keith Busch <kbusch@kernel.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XCzbs8LyGHeU

On 6/14/21 8:31 PM, Klaus Jensen wrote:
> On Jun 12 01:46, Heinrich Schuchardt wrote:
>> On machines with version > 6.0 replace a missing EUI-64 by a generated
>> value.
>>
>> Signed-off-by: Heinrich Schuchardt <xypron.glpk@gmx.de>
>> ---
>> v2:
>> =C2=A0=C2=A0=C2=A0=C2=A0new patch
>> ---
>> docs/system/nvme.rst | 2 ++
>> hw/core/machine.c=C2=A0=C2=A0=C2=A0 | 1 +
>> hw/nvme/ns.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 9 ++++++=
+++
>> hw/nvme/nvme.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2 ++
>> 4 files changed, 14 insertions(+)
>>
>> diff --git a/docs/system/nvme.rst b/docs/system/nvme.rst
>> index b5f8288d7c..33a15c7dbc 100644
>> --- a/docs/system/nvme.rst
>> +++ b/docs/system/nvme.rst
>> @@ -84,6 +84,8 @@ There are a number of parameters available:
>> ``eui64``
>> =C2=A0 Set the EUI-64 of the namespace. This will be reported as a "IEE=
E
>> Extended
>> =C2=A0 Unique Identifier" descriptor in the Namespace Identification
>> Descriptor List.
>> +=C2=A0 Since machine type 6.1 a non-zero default value is used if the
>> parameter
>> +=C2=A0 is not provided. For earlier machine types the field defaults t=
o 0.
>>
>> ``bus``
>> =C2=A0 If there are more ``nvme`` devices defined, this parameter may b=
e
>> used to
>> diff --git a/hw/core/machine.c b/hw/core/machine.c
>> index 55b9bc7817..d0e9348888 100644
>> --- a/hw/core/machine.c
>> +++ b/hw/core/machine.c
>> @@ -39,6 +39,7 @@
>> GlobalProperty hw_compat_6_0[] =3D {
>> =C2=A0=C2=A0=C2=A0 { "gpex-pcihost", "allow-unmapped-accesses", "false"=
 },
>> =C2=A0=C2=A0=C2=A0 { "i8042", "extended-state", "false"},
>> +=C2=A0=C2=A0=C2=A0 { "nvme-ns", "eui64-default", "off"},
>> };
>> const size_t hw_compat_6_0_len =3D G_N_ELEMENTS(hw_compat_6_0);
>>
>> diff --git a/hw/nvme/ns.c b/hw/nvme/ns.c
>> index 45e457de6a..4275c3db63 100644
>> --- a/hw/nvme/ns.c
>> +++ b/hw/nvme/ns.c
>> @@ -56,6 +56,7 @@ void nvme_ns_init_format(NvmeNamespace *ns)
>>
>> static int nvme_ns_init(NvmeNamespace *ns, Error **errp)
>> {
>> +=C2=A0=C2=A0=C2=A0 static uint64_t ns_count;
>> =C2=A0=C2=A0=C2=A0 NvmeIdNs *id_ns =3D &ns->id_ns;
>> =C2=A0=C2=A0=C2=A0 uint8_t ds;
>> =C2=A0=C2=A0=C2=A0 uint16_t ms;
>> @@ -73,6 +74,12 @@ static int nvme_ns_init(NvmeNamespace *ns, Error
>> **errp)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 id_ns->nmic |=3D NVME_NMIC_N=
S_SHARED;
>> =C2=A0=C2=A0=C2=A0 }
>>
>> +=C2=A0=C2=A0=C2=A0 /* Substitute a missing EUI-64 by an autogenerated =
one */
>> +=C2=A0=C2=A0=C2=A0 ++ns_count;
>> +=C2=A0=C2=A0=C2=A0 if (!ns->params.eui64 && ns->params.eui64_default) =
{
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ns->params.eui64 =3D ns_cou=
nt + NVME_EUI64_DEFAULT;
>> +=C2=A0=C2=A0=C2=A0 }
>> +
>> =C2=A0=C2=A0=C2=A0 /* simple copy */
>> =C2=A0=C2=A0=C2=A0 id_ns->mssrl =3D cpu_to_le16(ns->params.mssrl);
>> =C2=A0=C2=A0=C2=A0 id_ns->mcl =3D cpu_to_le32(ns->params.mcl);
>> @@ -533,6 +540,8 @@ static Property nvme_ns_props[] =3D {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 params.max=
_open_zones, 0),
>> =C2=A0=C2=A0=C2=A0 DEFINE_PROP_UINT32("zoned.descr_ext_size", NvmeNames=
pace,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 params.zd_=
extension_size, 0),
>> +=C2=A0=C2=A0=C2=A0 DEFINE_PROP_BOOL("eui64-default", NvmeNamespace,
>> params.eui64_default,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 true),
>> =C2=A0=C2=A0=C2=A0 DEFINE_PROP_END_OF_LIST(),
>> };
>>
>> diff --git a/hw/nvme/nvme.h b/hw/nvme/nvme.h
>> index ac90e13d7b..3fb869731d 100644
>> --- a/hw/nvme/nvme.h
>> +++ b/hw/nvme/nvme.h
>> @@ -26,6 +26,7 @@
>>
>> #define NVME_MAX_CONTROLLERS 32
>> #define NVME_MAX_NAMESPACES=C2=A0 256
>> +#define NVME_EUI64_DEFAULT 0x27fed9272381cbd0UL
>
> Is there any significance to this value? Any particular reason it is not
> using the QEMU OUI (52:54:00)?

52:54:00 does not exist in http://standards-oui.ieee.org/oui/oui.txt
So this seems not to be an OUI. We should not use a number that IEEE may
sell to some other entity.

Until somebody buys a 36bit OUI in the name of QEMU for 780 USD we have
to use a locally assigned number.

Best regards

Heinrich

>
>>
>> typedef struct NvmeCtrl NvmeCtrl;
>> typedef struct NvmeNamespace NvmeNamespace;
>> @@ -84,6 +85,7 @@ typedef struct NvmeNamespaceParams {
>> =C2=A0=C2=A0=C2=A0 uint32_t nsid;
>> =C2=A0=C2=A0=C2=A0 QemuUUID uuid;
>> =C2=A0=C2=A0=C2=A0 uint64_t eui64;
>> +=C2=A0=C2=A0=C2=A0 bool=C2=A0=C2=A0=C2=A0=C2=A0 eui64_default;
>>
>> =C2=A0=C2=A0=C2=A0 uint16_t ms;
>> =C2=A0=C2=A0=C2=A0 uint8_t=C2=A0 mset;
>> --
>> 2.30.2
>>
>>
>

