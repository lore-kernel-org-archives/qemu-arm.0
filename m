Received: by 2002:a17:504:f96:b0:1be9:327d:8ee3 with SMTP id oa22csp153554njb;
        Mon, 17 Feb 2025 08:33:46 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUGm3AijFxBG1Q6xhgFSQ+7IJbujsX2SREphPeFKDd7ZK+TsjHmSre4j0UX0dIygPd92yh2NYc0JLnscw==@linaro.org
X-Google-Smtp-Source: AGHT+IF4NbvchIQYDghhnMkTpNmvb78ivp37p/hu4A71Pm8DWeMnEUR/RbHuQnGh8Knd/BJELBGC
X-Received: by 2002:a05:6214:194b:b0:6e4:3cf1:5624 with SMTP id 6a1803df08f44-6e66ce2db84mr141235926d6.39.1739810026282;
        Mon, 17 Feb 2025 08:33:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739810026; cv=none;
        d=google.com; s=arc-20240605;
        b=lQvUpGyEXaLpU1DxKbnPGpGtpnrwlof0iC1fQek0DsBOg481s+ABwyMR2MZ1CjXIHO
         f3HHVM4kjhbRdW3A2CZ9jq7TIiiVVj3qKQitSLdfqJkFhC0XrFac2u6ILQAKQBKAfDCp
         9kvETy0hCwxb1VjSv5rVmgrWBFItXaBKxD2hmY0P6/x32thJ+2O7bgw/bXAE6/Jss8tJ
         fd4XOwVofbvThNh+fEvJvA+ECdEs0QeStUyLUy8dqmvKUcm/BNSVTGSoPzxm1OfWj3E/
         G1c+qjZXFowmtmPiFJR4vAqN6OvwfK49V2nsXAv8yFSx6inE2t6wiRUDXSNfTB1ClLKP
         d93g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:references:in-reply-to:subject:cc:to:from
         :date:dkim-signature;
        bh=prUa2diEnEeJXeNZX3iDb7yAW70/AEkniWxY+/HiH/Q=;
        fh=rIkQQFl3tBuFh72pDAoHVHKR4cxQXg+0iEy9xnt932E=;
        b=Pet+1XOPOu/WN0BPdB4daDd62Qt/TArZnFGJ1ldfeqM06x942+HptK0JHIt0UxPRJK
         Q7aAoP2UK7LjJPAX4fXDa8Gd6/UV7/zuduw4fHgRbkzl8Eofo3yXSZtG75iJmgw7/U+G
         C52vBQ3aDFpQcOsBLXqZN53L/OHOlP9UpF0ucpcAx6Ccw0/O02ZMy/SKL6yXmAyXh57s
         Z+1gw1qlbBUQk8SkcFMSPAgKfd7Zr7BXbUzoG5EzuEsbe3c8YA2U8AOco8fOsEiM+70L
         d1CcuaObGjYp6UPhMK2+bZkEWIPm3GtgX1/dfuedBIY6p9a5baGsrnq7TdfFt/TSWCZw
         a+EA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=GkaGlOR3;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e65d9c55b6si92250996d6.391.2025.02.17.08.33.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 17 Feb 2025 08:33:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=GkaGlOR3;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tk43l-0006kn-To; Mon, 17 Feb 2025 11:33:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1tk43k-0006kX-8o; Mon, 17 Feb 2025 11:33:28 -0500
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1tk43i-0006gW-DG; Mon, 17 Feb 2025 11:33:27 -0500
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-aaec111762bso1053063366b.2; 
 Mon, 17 Feb 2025 08:33:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739810004; x=1740414804; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=prUa2diEnEeJXeNZX3iDb7yAW70/AEkniWxY+/HiH/Q=;
 b=GkaGlOR3sU4mdxJRPMg+BOS8VrVV37RyULJz4TOopohWIvnXlM2/UnHqKb2A9+5WFU
 HO1Qn3p0bxls5rgxXVQNe3gqhwduqPImiyHB2IhUZvxoX4m+5swT+KkmAmKuL0WrPWJn
 uDFupt9YV9vwTa3JcG6eEw/5sMMpa9eTpTcKOYaM8XW1OWfI9fO1RP7qax/EsueMe8Ux
 C8mzvWNAlZnV/r6+sTl6JVu1EtfLf4ldsmIS4Aa4hl7NagFfazbzWwv+x0aPmiW96+ZA
 eTp9mg6PcEcc5mPwBDlmIA9PUoSeE2Png9v7jxIjN+5PCSdc78hvQEkdNjodORylPF14
 kH2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739810004; x=1740414804;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=prUa2diEnEeJXeNZX3iDb7yAW70/AEkniWxY+/HiH/Q=;
 b=ixYUD0JG3JCVIpgJ9VqgIaAsi4E5dHh9k96xTs7/1PQ6gAY8NlRoi2q2KINQ1YijaK
 kB3fVSJpDCBeopinXSwjl7zBhOzAIWkiYixz/DCHwRCQQ69pddzEC70UFwe/9mDKH7Ne
 dDUNQGt5ie63ytWZTI3uradQ3RY6PPdjIFnNaYOvZU529OQMoZRe9wOMOofSPPfcU70k
 1aw0pKNavGIwKtrg4mzlsG+Lwvn6CjbYJ1/H3oaPlHmlfbtiLD0A+Nu0MQinNFVicvQj
 qOA+HU14nbhWgY8fDhLqY2dPPhSehQUNiSOyWH/UicfFgZ0EzMnbDFyJzflhgboCH78T
 XRQw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX84Ie+w72uxJbiCPOtEP0YK6E/FBPnD54iXE/Ie9c5zZviR+VU96xs9OrZNvQa7h6DmwMZ8eQDiw==@nongnu.org
X-Gm-Message-State: AOJu0Yzh/AZhiXzW51yy8tZli69RlOCpvPSbKXPT+s1UVTt/H4QKAVor
 UIJl/vd6WznLxKXHEBkxkNzuiMq+eO/mBbuDZrvQe0CjTDU2PCvZ
X-Gm-Gg: ASbGncs9+EDSr7Supb14ea5SJMpm3Vmuqku3dQDbAKjhwZRC39Br30dJzMCGLh6jMLh
 YHushTuyADvU7D7f+/1HGyncbUqHfGrbu4uFeMWD1gpePRUrdTFAl3SpBSci5Rg4LNpAwfy9LQN
 qz08aFDkQkjBoUTOUu1OLrDnDeH/8ty5RtQVm+sRuisgVrz1jJZt0PYrUQUD9g9fU7iI8WpvroD
 iTFsigXmFHY3T2zbrNdOt4Rz92Tgttm7fb3AFOaW+LVb02iflYGxw/OS4l+vzm5eh46Njrs3y2P
 Kpfa/pzKEJc=
X-Received: by 2002:a17:907:2da7:b0:ab7:eff8:f92e with SMTP id
 a640c23a62f3a-abb70d36233mr975119666b.21.1739810003841; 
 Mon, 17 Feb 2025 08:33:23 -0800 (PST)
Received: from [127.0.0.1] ([90.187.110.129]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abb9f3a695dsm185382866b.2.2025.02.17.08.33.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Feb 2025 08:33:23 -0800 (PST)
Date: Mon, 17 Feb 2025 16:33:20 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
CC: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v2 08/18] hw/arm/fsl-imx8mp: Add PCIe support
In-Reply-To: <CAFEAcA8Ravyh4_iVXvmHzQzXa=gOTu8+-OPNLRLVB78if8i4Ww@mail.gmail.com>
References: <20250204092112.26957-1-shentey@gmail.com>
 <20250204092112.26957-9-shentey@gmail.com>
 <CAFEAcA8Ravyh4_iVXvmHzQzXa=gOTu8+-OPNLRLVB78if8i4Ww@mail.gmail.com>
Message-ID: <A84E9FE5-390E-42C4-8DCE-8C796D21E7C0@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: e5qwbS3kSGoh



Am 17=2E Februar 2025 13:40:48 UTC schrieb Peter Maydell <peter=2Emaydell@=
linaro=2Eorg>:
>On Tue, 4 Feb 2025 at 09:21, Bernhard Beschow <shentey@gmail=2Ecom> wrote=
:
>>
>> Linux checks for the PLLs in the PHY to be locked, so implement a model
>> emulating that=2E
>>
>> Signed-off-by: Bernhard Beschow <shentey@gmail=2Ecom>
>> ---
>
>> +static const VMStateDescription fsl_imx8m_pcie_phy_vmstate =3D {
>> +    =2Ename =3D "fsl-imx8m-pcie-phy",
>> +    =2Eversion_id =3D 1,
>> +    =2Eminimum_version_id =3D 1,
>> +    =2Efields =3D (const VMStateField[]) {
>> +        VMSTATE_UINT8_ARRAY(data, FslImx8mPciePhyState,
>> +                            ARRAY_SIZE(((FslImx8mPciePhyState *)NULL)-=
>data)),
>
>Use a defined constant for the number of array elements, please=2E
>We don't do this thing with ARRAY_SIZE of a cast NULL pointer
>anywhere else in the codebase=2E

Ack -- will change to a named constant=2E I think I took inspiration from =
<https://gitlab=2Ecom/qemu-project/qemu/-/blob/v9=2E2=2E1/hw/scsi/vmw_pvscs=
i=2Ec?ref_type=3Dtags#L1276>

>
>> +        VMSTATE_END_OF_LIST()
>> +    }
>> +};
>> +
>> +static void fsl_imx8m_pcie_phy_class_init(ObjectClass *klass, void *da=
ta)
>> +{
>> +    DeviceClass *dc =3D DEVICE_CLASS(klass);
>> +
>> +    dc->realize =3D fsl_imx8m_pcie_phy_realize;
>> +    dc->vmsd =3D &fsl_imx8m_pcie_phy_vmstate;
>> +}
>
>This is missing the reset method=2E

Indeed=2E I'll add it=2E

Thanks for the review,
Bernhard

>
>thanks
>-- PMM
