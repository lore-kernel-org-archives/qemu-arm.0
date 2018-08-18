Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp1120801wrd;
        Sat, 18 Aug 2018 03:10:45 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPz+XoXpVD5XlA560nwOzydnltQWhXn2l8bVwWE4kD1/uKp6gNLmM1IO+89hW0wAYWYjdWTc
X-Received: by 2002:a37:6e01:: with SMTP id j1-v6mr35731448qkc.70.1534587045353;
        Sat, 18 Aug 2018 03:10:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1534587045; cv=none;
        d=google.com; s=arc-20160816;
        b=a5Sq+lQchSKObi3m01KT4Iy/reHgOlqmfMmzlVhFX6JpGgs+UkeGBLoochkalUaVuO
         nUii801DnWDP270t2lOk1S2l5egKEIzQMj4cVWhd6UlJEiXFTAjPX9rS66vQfx5kmA5j
         4+WNOr27n/uIpQM1ZronLOc/sl/rzXFaWn76Lu07x5T7eA9Agw8EqiPVVe5JuoM12OdW
         77VNvr3kxjdyOLTL5eJfP3vvaI4r/33W2qkvevLtJgoi85kZJy+RDWOI2bhXYBMPsdOX
         D/LWLPafsNC9F2es2mpX6VEgvrRXmqNLMDako5KSBIgHSzSGpHnOdrDJLnIFS+CXth/A
         k3rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=fCOYwduRWFhtcZRtYgRVilpQWvMcIC7cGPjiC/2L4GI=;
        b=EOOQ9fpcYQp0w3dBhEdCWJcwCWTJs0beSmf7tQyKZrbtA2N+PiU2e/xGkZHidmod1x
         ZBbT2brlPRVyzhfFzupSMAmRUqHRPzDbizlvIkPpfEgMu25eTYFc7ArR15BUUVbMjyPO
         SpNjWYOZu4++yv/WZ+J/rZSAnO9gX2QZJJqz4CLrF99jdzHAb+NRLPUezGBOMaC+Bztn
         fA5nJsomDr888r1/Ae4eU/PoWDfwoODRwdVgssi16NN+9o3G1M1BsEx8fAt9xd1Ut4Im
         T0eNKyprLRDqX1XmAFi1QRNSfPibStBg93p1yw2W4N1x1EkI4BzdQasJ4+isX58bMS9d
         fqWA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=VFuxMQ5P;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l190-v6si3833310qkf.218.2018.08.18.03.10.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 18 Aug 2018 03:10:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=VFuxMQ5P;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38257 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fqyBw-0000LS-Qn
	for alex.bennee@linaro.org; Sat, 18 Aug 2018 06:10:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40786)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fqy9z-0007H0-7N
	for qemu-devel@nongnu.org; Sat, 18 Aug 2018 06:08:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fqy7T-0006vN-QZ
	for qemu-devel@nongnu.org; Sat, 18 Aug 2018 06:06:08 -0400
Received: from mail-oi0-x241.google.com ([2607:f8b0:4003:c06::241]:40544)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fqy7T-0006uS-JW
	for qemu-devel@nongnu.org; Sat, 18 Aug 2018 06:06:07 -0400
Received: by mail-oi0-x241.google.com with SMTP id w126-v6so18165450oie.7
	for <qemu-devel@nongnu.org>; Sat, 18 Aug 2018 03:06:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=fCOYwduRWFhtcZRtYgRVilpQWvMcIC7cGPjiC/2L4GI=;
	b=VFuxMQ5Pxd1GmA9qWWHPpArVlmRjaPxsyYGBZINWB52B2qZsTR8N8ssGeWVv5YBfVi
	3kDUYdbfE75bDsVpUQg4JqAhUY+mZJE945PNX0dqREaC3mmHXhOOXlncRJVP1ET+juEK
	rzjK1xUFIEwlwbSj30aDX7LlBXRfWAy8d579E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=fCOYwduRWFhtcZRtYgRVilpQWvMcIC7cGPjiC/2L4GI=;
	b=RE+tCSvdaRLXsoTtv6Kq01dLyp0znNf5AaGlc0mYvq5UB0FCnO4OHKUOlFuBoQ8aR0
	KvglkRLzQmeo2qMP1wWuO/wnenicBiUW5cqUsPmqbeoQ8tapaHOzW+ttboA4aQtyishB
	2vJyFuDBmaWs1fvaqiV3qupmBZtXcR4vsHUKTPyqHUgGp9XHwsE+IArkAGHwWzmq1sTJ
	5BQl8hlCp/0tS30aJBfnW3PPfyO2CBLYqlZrqZM55cWQQOc/S5d1DLEolg7ySXXUZdeq
	kVCJatV5DSXij3Fy4qUb/JckqNOzPdR+A5Q1a7TOUo/qZm4EflEcriHuIvVReBS92+Sw
	raLg==
X-Gm-Message-State: AOUpUlFvArQ8QQocNk4APMrC/CMUBEZ9r3iW6IPLOmmDobTTkfs+ScyY
	uNvg3K8kNDkNv5fsPctJcojDceqLcJusjtPsirbBCg==
X-Received: by 2002:aca:ac54:: with SMTP id v81-v6mr5739345oie.1.1534586767078;
	Sat, 18 Aug 2018 03:06:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:5c8a:0:0:0:0:0 with HTTP; Sat, 18 Aug 2018 03:05:46
	-0700 (PDT)
In-Reply-To: <3fbb1f6d-8615-f540-d902-67ea9026777b@amsat.org>
References: <20180809130115.28951-1-peter.maydell@linaro.org>
	<20180809130115.28951-9-peter.maydell@linaro.org>
	<3fbb1f6d-8615-f540-d902-67ea9026777b@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 18 Aug 2018 11:05:46 +0100
Message-ID: <CAFEAcA9_76xjs6cb223q0zCQyi3n67_-f8Ga+2yYRvXM73dk9Q@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::241
Subject: Re: [Qemu-devel] [Qemu-arm] [PATCH 08/16] hw/misc/iotkit-secctl:
 Wire up registers for controlling MSCs
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	"patches@linaro.org" <patches@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2f7OK8i6JX+d

On 18 August 2018 at 01:37, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> w=
rote:
> On 08/09/2018 10:01 AM, Peter Maydell wrote:
>> The IoTKit does not have any Master Security Contollers itself,
>> but it does provide registers in the secure privilege control
>> block which allow control of MSCs in the external system.
>> Add support for these registers.
>>
>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>> ---

>>      case A_SECMSCINTEN:
>> -        qemu_log_mask(LOG_UNIMP,
>> -                      "IoTKit SecCtl S block write: "
>> -                      "unimplemented offset 0x%x\n", offset);
>
> Maybe:
>
>            if (value & ~0xffff) {
>                GUEST_ERROR(...)
>            }

We don't generally bother to log writes of raz bits as errors.


thanks
-- PMM
