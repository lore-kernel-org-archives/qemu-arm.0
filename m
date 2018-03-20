Received: by 10.28.91.67 with SMTP id p64csp3697914wmb;
        Tue, 20 Mar 2018 04:22:41 -0700 (PDT)
X-Google-Smtp-Source: AG47ELtCtAiV+bmZG53A/EYcLCfQC5fYDUqErQ3RzB7NCAVEkETsBRxgZ4Mxx4hxnk0RQiHpIDp6
X-Received: by 10.55.138.135 with SMTP id m129mr22524830qkd.59.1521544960978;
        Tue, 20 Mar 2018 04:22:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521544960; cv=none;
        d=google.com; s=arc-20160816;
        b=QyR23vEdz0DWrs4o0/Z1ssdvvIoSXl2jfRZFGF6iCw4ZISBG+GKkmT2FC80AhTBQTX
         I0fUKs3za/B8DGbDT9nG2Bq1CMRgKI+ZCTSc48HtAvH8I3Bku8qypbHiVwEd5Uqv9eip
         P7euog7vSbIGNf5CH+u3V4RoPyscqFs204tbh5uH+U9B9P2xWy0socNZuOavaafBRF/U
         jhnC9tc9iSTKf/AdG3KF+62nKuX19lfx6iJYcuSFbyt6GCg0HArTzy9B6VOZtgkzd1T5
         0LjZTBVuAyLBOeY/t5IiZTtqKV7Z8BblnetyF7cYjotLvdqfNX1Ag7WeW4i3+aZFG18J
         mhtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=o8IISk7cT+ujK71/+GUdOKGkzqjlfiHx1sR+JK0riQM=;
        b=o/g63hr38X2IERzFrKhk18qK3NML/+LG6xJjwGvkEV90Z6xf+C03QqxiK4NxmsPrlz
         F6s5C71UGnS6RwUXGPGa4ucdPjLBmfX9LJIywGrH3f8ZZ72vy+RY3BiZRSXUC9NoNnIP
         7cN61RkcKYVcAfROPatPQo1vcZpGTTvTS6F084ZbjwtbLdB84Cs50XmEuNmaif397p5j
         ubuydnD1+QCFPAOahMV+AfAEmPKsKzXKkEh6igR1WZp0cfOMBr8eBQjJ+VxPDlxnQP6l
         6ANtPgVlD9u3dZ9rhDL3K3g3niIOTxBVZoBxTwtQLCGQ0yfgDOiwXOICohfBVl/k12Dd
         KGIA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=d5Mp2MTR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 96si2715298qkt.393.2018.03.20.04.22.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 20 Mar 2018 04:22:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=d5Mp2MTR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47478 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eyFLk-0008Ir-GE
	for alex.bennee@linaro.org; Tue, 20 Mar 2018 07:22:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50608)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eyFLW-0008Ho-9F
	for qemu-arm@nongnu.org; Tue, 20 Mar 2018 07:22:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eyFLV-0004TT-BI
	for qemu-arm@nongnu.org; Tue, 20 Mar 2018 07:22:26 -0400
Received: from mail-ot0-x242.google.com ([2607:f8b0:4003:c0f::242]:38859)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eyFLV-0004Sg-6C
	for qemu-arm@nongnu.org; Tue, 20 Mar 2018 07:22:25 -0400
Received: by mail-ot0-x242.google.com with SMTP id 95-v6so1271580ote.5
	for <qemu-arm@nongnu.org>; Tue, 20 Mar 2018 04:22:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=o8IISk7cT+ujK71/+GUdOKGkzqjlfiHx1sR+JK0riQM=;
	b=d5Mp2MTRj5UPi0Vu3Hv4+F0DXOM4bRRTpwiOfcK2jjOm698aAtyWX92CABHxVmmor+
	NdwDCj9MIx7G7DOELYjxhCdAzY6q+64N0nirmcnUduELxVqe0+UsaRh46fj4z9wonBpO
	VvKd3Dx8u5NVC2RsnlZuXLBDaRg13TXJUwQsY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=o8IISk7cT+ujK71/+GUdOKGkzqjlfiHx1sR+JK0riQM=;
	b=qg3RECg5WohcVN0j0bM2nO1inS6c5RTGxl4JxzHgmRHnmzk/ygyV7hQ4shwrUnszNM
	vVfrXT/KiXb0QHzSzBvh7Zd7XEtgM8Gdw3r4o80b/cymHqt1qqS8lBRAugYgW2jev7oR
	AvwFhCP4yXbHDMnSwytFjSrIOokbEIlzO+6qovfaA58e3NA0D2OwykM42SA/2PjPaOVv
	k8lrqVorREFCXXN/U1rHTqVKnluvKwlyOKlduHhrx036sBbPP1c/1ZGK8mUD/vujFO2x
	yCVakYm5C9MJVdipaf79wlr1eQwxa0Odf9hhvJOyVz/sjt3izybjIwiRILJ0jd+JceUe
	0NIw==
X-Gm-Message-State: AElRT7E910noEqKqXsAB7ZLx95L6rVtsAd5JsvF+69dMb8gQbBsmYaXZ
	YEl5In9sy6jfjH9UbD8HscAVL6Co4jJVbzCjXc330Q==
X-Received: by 2002:a9d:40ee:: with SMTP id
	t43-v6mr6876019oti.258.1521544944390; 
	Tue, 20 Mar 2018 04:22:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:2286:0:0:0:0:0 with HTTP; Tue, 20 Mar 2018 04:22:03
	-0700 (PDT)
In-Reply-To: <1521530809-11780-3-git-send-email-zhaoshenglong@huawei.com>
References: <1521530809-11780-1-git-send-email-zhaoshenglong@huawei.com>
	<1521530809-11780-3-git-send-email-zhaoshenglong@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 20 Mar 2018 11:22:03 +0000
Message-ID: <CAFEAcA96qV_f7i_36Yzb-QV7W9SRHKfJpg=rvv3tia2X-Xi7QQ@mail.gmail.com>
To: Shannon Zhao <zhaoshenglong@huawei.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::242
Subject: Re: [Qemu-arm] [PATCH v2 2/2] arm_gicv3_kvm: kvm_dist_get/put: skip
 the registers banked by GICR
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
Cc: Eric Auger <eric.auger@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vePPkCwFaiQR

On 20 March 2018 at 07:26, Shannon Zhao <zhaoshenglong@huawei.com> wrote:
> While we skip the GIC_INTERNAL irqs, we don't change the register offset
> accordingly. This will overlap the GICR registers value and leave the
> last GIC_INTERNAL irq's registers out of update.
>
> Fix this by skipping the registers banked by GICR.
>

I'm still not entirely sure what the underlying problem
you're trying to fix is...

Do we fail to correctly migrate a VM without this change?
Does the code work on some host CPU/GIC implementations but
not others? Is this just improving efficiency by avoiding
doing some unnecessary work?

thanks
-- PMM
