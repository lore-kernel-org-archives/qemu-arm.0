Received: by 10.25.44.15 with SMTP id s15csp2378717lfs;
        Thu, 13 Jul 2017 09:21:55 -0700 (PDT)
X-Received: by 10.200.40.34 with SMTP id 31mr6274103qtq.22.1499962914122;
        Thu, 13 Jul 2017 09:21:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499962913; cv=none;
        d=google.com; s=arc-20160816;
        b=NdC+aF1pCcVtvMQ1nkoliYO6QMNRrFikB+LIbP93LgNjFmWuaI8hvFGmnqOZODDU0E
         P6LYEZ2+8Dm7YKLlZTHugvSLKbwcDfkjfPfcERfKd2fULTFNu2f39Vxmms5rH3u/XUXQ
         j1gcGyeBdB+hqw1ZbWWzbTuwZLatqD8qGOGDKWOdUzzcHMBu6iL7J9ypW2sU1aTKcS3T
         GxvMGAK8s+DmwQIadsOHMhb/LuFY4cQvmUZ8UQynFlX7duseQj6h46EQMf8HkJXbyEuM
         8co28ZYarAHCpozzs5kbRQ2BxA9h1rpnueZieDk2rYpkmWEw6i0vBFZfZAnPZhNX2AXj
         b5OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=y5WoJ3nNewiT1A9WF00PTEV0wgIzj87eEff6zNFAAho=;
        b=mESJ88WQjNVIuSEQTFxiHTDGvD8KlbZgesLsoHlzPZXtkzXTBpo32CZ5Zjh9ZJexy9
         ugOQ9yqUpIon/h+wux3t7+4UrN3y9vW5GljmSlY7Qdzgo/nfmsNVNUtlu9KKYBUKyGST
         yH+wIfAJFPjP/aRuTzW/nZibwuZhn44/TxG3ODoiJd3NRkYiaAIqrneBdALA7Y1vWzja
         JBMIrG6I6TMAEHObBb4HXl6eAWk49jZCSHhJ7YrWnj0ualrgbUfc9e5Y7Nk05VGnWgWH
         PF6ttKUMYFMvzgbzx6eYUXJh8xZqyuhfgtybh1c4z7Rk7kYhu1Laf2Rn+jmEgWYEh44z
         ANow==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@semihalf-com.20150623.gappssmtp.com header.b=XK0r+T4K;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id 30si5240756qtf.266.2017.07.13.09.21.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 13 Jul 2017 09:21:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@semihalf-com.20150623.gappssmtp.com header.b=XK0r+T4K;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:32857 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dVgsA-00061T-Ok
	for alex.bennee@linaro.org; Thu, 13 Jul 2017 12:21:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45464)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <tn@semihalf.com>) id 1dVdgz-0002p8-Et
	for qemu-arm@nongnu.org; Thu, 13 Jul 2017 08:58:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <tn@semihalf.com>) id 1dVdgw-0002Vj-St
	for qemu-arm@nongnu.org; Thu, 13 Jul 2017 08:58:05 -0400
Received: from mail-lf0-x22c.google.com ([2a00:1450:4010:c07::22c]:34416)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <tn@semihalf.com>) id 1dVdgw-0002VV-K6
	for qemu-arm@nongnu.org; Thu, 13 Jul 2017 08:58:02 -0400
Received: by mail-lf0-x22c.google.com with SMTP id t72so36313605lff.1
	for <qemu-arm@nongnu.org>; Thu, 13 Jul 2017 05:58:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=semihalf-com.20150623.gappssmtp.com; s=20150623;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=y5WoJ3nNewiT1A9WF00PTEV0wgIzj87eEff6zNFAAho=;
	b=XK0r+T4K7hBCxstVLjkXK0tyReSamobLIQVnq5FC6VQ9aEP+6mqL8CiFgcfkdFOINh
	9o0n6yoN3CFHpNxcGNa3ueyGUVzLy/byPy1LdhvTtcqLcvmkrUF15PbbrUySIFcQBX3q
	VFNS6q2BU9geITT86BlbWQgeQWLmG+g2mgojZ38fFLWN1VbrnD1Hkc41Vz94+m1AkTGR
	d1Wx8/l5QHVx90v2JH2J8LlvObhIBiH4mcfYDlqoFXUIk6e8DYxMZp0JlQ32i3Kqdudo
	GbHY0gmRinumAlTSs/I5TtivYcVA4S3zeHtVATlnCj7RZkkwowTKRKOiJ2E9qdsnq7ZP
	pPlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=y5WoJ3nNewiT1A9WF00PTEV0wgIzj87eEff6zNFAAho=;
	b=enh8AGtsZhwGW9I0xvfvO+wsqeoZERhS+1I3SEbFpimSY84qQQlud9BAE1AAWvWFeG
	dPK+myltF0Y4PRrYXQNK3SL+fDvIGTT5b/JhMKF1amaTslH/lj+ziOVOx1URNNVvc6+6
	KJ/mZzVcnK8RvR9+/9/cEynzUpjWQ1dsX9eD4AKLSSuyUwX2O/sQgRwtVD9Xnn0LoerU
	NhXSRu0UuewVg5eO+X+XV0YCsSCwEpl9xcpTsKi1/cXWXPX9M5VWaAugnxkwV5wmO/he
	gm2t3Pp+mHcq16yhHlUBkScmcJdEIlG8u5kOdEU7xLmJ0CXFbBiwWN5PsHQrzAAXUpGd
	/YRA==
X-Gm-Message-State: AIVw1107eFoej6mBMAbEeXnGqVtPm9DNivJ2pTcGL5nnUB46i4e61Ofe
	i+v7GW0yECwZlx+H
X-Received: by 10.46.15.25 with SMTP id 25mr1192687ljp.90.1499950681128;
	Thu, 13 Jul 2017 05:58:01 -0700 (PDT)
Received: from [10.0.0.85] (31-172-191-173.noc.fibertech.net.pl.
	[31.172.191.173]) by smtp.googlemail.com with ESMTPSA id
	t7sm1156500ljd.31.2017.07.13.05.57.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 13 Jul 2017 05:57:55 -0700 (PDT)
To: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
	peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
	alex.williamson@redhat.com, prem.mallappa@gmail.com
References: <1499633493-19865-1-git-send-email-eric.auger@redhat.com>
	<1499633493-19865-3-git-send-email-eric.auger@redhat.com>
From: Tomasz Nowicki <tn@semihalf.com>
Message-ID: <448765a4-1ffc-f27b-fcb1-61445fd785d4@semihalf.com>
Date: Thu, 13 Jul 2017 14:57:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Firefox/52.0 Thunderbird/52.1.1
MIME-Version: 1.0
In-Reply-To: <1499633493-19865-3-git-send-email-eric.auger@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4010:c07::22c
X-Mailman-Approved-At: Thu, 13 Jul 2017 12:19:38 -0400
Subject: Re: [Qemu-arm] [RFC v5 2/8] hw/arm/smmuv3: smmuv3 emulation model
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
Cc: mohun106@gmail.com, drjones@redhat.com, tcain@qti.qualcomm.com,
	Radha.Chintakuntla@cavium.com, Sunil.Goutham@cavium.com,
	mst@redhat.com, jean-philippe.brucker@arm.com,
	robin.murphy@arm.com, will.deacon@arm.com, peterx@redhat.com,
	bharat.bhushan@nxp.com, christoffer.dall@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7JFPP4uNZIUk

Hi Eric,

On 09.07.2017 22:51, Eric Auger wrote:
> From: Prem Mallappa <prem.mallappa@broadcom.com>
> 
> Introduces the SMMUv3 derived model. This is based on
> System MMUv3 specification (v17).
> 
> Signed-off-by: Prem Mallappa <prem.mallappa@broadcom.com>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> 
> ---
> v4 -> v5:
> - change smmuv3_translate proto (IOMMUAccessFlags flag)
> - has_stagex replaced by is_ste_stagex
> - smmu_cfg_populate removed
> - added smmuv3_decode_config and reworked error management
> - remwork the naming of IOMMU mrs
> - fix SMMU_CMDQ_CONS offset
> 

[...]

> +
> +static void smmu_update_qreg(SMMUV3State *s, SMMUQueue *q, hwaddr reg,
> +                             uint32_t off, uint64_t val, unsigned size)
> +{
> +   if (size == 8 && off == 0) {
> +        smmu_write64_reg(s, reg, val);

Based on my observation we never get here.

If I read the code correctly, 
memory_region_dispatch_{write|read}()->memory_region_{write|read}_accessor() 
will cut all 8-bytes accesses into 4-bytes slices. However, this makes 
my SMMUv3 register handling happy:

  static const MemoryRegionOps smmu_mem_ops = {
      .read = smmu_read_mmio,
      .write = smmu_write_mmio,
      .endianness = DEVICE_LITTLE_ENDIAN,
      .valid = {
          .min_access_size = 4,
          .max_access_size = 8,
      },
+    .impl = {
+        .min_access_size = 4,
+	.max_access_size = 8,
+    },
  };

Thanks,
Tomasz
