Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9D951125876
	for <qemu-arm@archiver.kernel.org>; Wed, 11 Mar 2026 19:23:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w0P96-0001AC-TL; Wed, 11 Mar 2026 15:23:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jithu.joseph@oss.qualcomm.com>)
 id 1w0P90-00018z-Dx
 for qemu-arm@nongnu.org; Wed, 11 Mar 2026 15:22:58 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jithu.joseph@oss.qualcomm.com>)
 id 1w0P8o-0005uT-Fr
 for qemu-arm@nongnu.org; Wed, 11 Mar 2026 15:22:48 -0400
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 62BFopp63601223
 for <qemu-arm@nongnu.org>; Wed, 11 Mar 2026 19:22:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ExL6ov9Qre6+ieL+jRYGqTL3gXjT302tSQhc38xzhjg=; b=JI/WFS0uXWOo6C8l
 FnUVk46LI/XV88wnHVMCNl0J0kRqHxvtSSiC4QRUDxbFGhsaiFlxxmF7zEXmqOpD
 Cx1HxgdyjwUznkNN5W26EfljRr5lyXfkzVS5WzOclEAjlBdXlJyasbb71D6+UsQc
 8YpWsVOt5n9fvJx290L0031UwrEcCX+2vw23ln7pWMDL4jtGO531MkI0jVJarEGy
 bT5mFMDCPZWPajt3nburiYsIbCuk0xi5jSxa8RSaUF/WoG863rONaOLqJ8zdCfqF
 nGxyTFWlzx71Ky5eOxRQc/wUHW/y6MBpZ25ylHiKu8mbV9sVget+NzZ7qoHh0Xm3
 JKBXVA==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com
 [209.85.167.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cubd4rrf5-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Wed, 11 Mar 2026 19:22:44 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id
 5614622812f47-466f55d78fdso1032925b6e.0
 for <qemu-arm@nongnu.org>; Wed, 11 Mar 2026 12:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1773256964; x=1773861764; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ExL6ov9Qre6+ieL+jRYGqTL3gXjT302tSQhc38xzhjg=;
 b=Vg3cth0t3WaB3nsTiYVHKwFFlkZpkgcGNpAtdwhHSadAbe8q4HGoloP6511TYjt8Z2
 Buzcr36SKvtm6Bp0aQMrAXUKGkZiGux1rF9oxY+bAOdAWvrPLaxp1bZb0sAgjxYIn1iL
 AeaFOMz377vfwfKF4g4TVHpNrEIuixbvzBsdK7FF8XYeAB2EzK4GNUeSUxT9938Vz3aA
 qbVZSUS5C3nMrQNA46byPBXWm5xSBbbenacqHAN1ksheM//SancdxPQ2V3zGHvnB7L0l
 rur5jyBTp2aPAfckCuHummX5D8pT3DxVbC3+3LmIsnq9jkGjF/Li7FkmFRV7OR/ovvns
 QaSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773256964; x=1773861764;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ExL6ov9Qre6+ieL+jRYGqTL3gXjT302tSQhc38xzhjg=;
 b=GT7vf8405KOSDn1pQHKC4ywVG0B4bw2P2nLQXg9IqvOTBxXQZdnOKuvSCOf9qFo4Lq
 JGaPc6GUdH5xNxQK3VqgU1z6Jwuf97Ctt+UvYJsJnMopp+BFjsWKeLTH85RVLmsdS4sP
 2T4MIR/7B1vQUmHUK+6jnyWOUznvXG3+umGT1mBtmADpH6lavAAQ5HsAXY07e+7hVSg1
 ui3Vjel3HQChDjqaakEAUnaxGGS0SlJc8mULbRjcNhkAai2qLgzYsHoCv/saIYz+yMIx
 0fyQ+w2WiI20glsFJXHZz8W4Am2PvB7fZCvEbkfEOoGQj+731JAZSl3AjtfLoHDEF04Z
 y3nw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUYrBfQoqx4r2PyzuwadBVKJS/BBLYVOYYHn2JmQSF2E/vYPE66J5yXXN3pahb8c3+HAGnfUbQc+w==@nongnu.org
X-Gm-Message-State: AOJu0YzuncVAU3Dqz3EhuzcUVjCyRsVvCCNlr5zupoCFvDkfukVhQy6K
 IaEMPqyu294mGvzpBKc2KFavb4IihjcxJDb63H3SMw8LZGvcY0bo9sy+mx9bbQ0kdWHxMrDAuSI
 09EW3cEN24A7YFkEmpWup4bUXnjqgH3f9dGuVYKXMWcjJFzH092psLdY=
X-Gm-Gg: ATEYQzxwtw9IGpMCt+7hLFcEGezAeaM6wcmUyAVIhpz0xNKGkXkXvXEUzHXUpcIPCJ6
 Ttcf6YJu38KaYL1HuJ7JP3S8OfHbIMB4w7SoW6S8xXr3g7SY3Wke7uRSttFsGomNyFt9RonHrGh
 DGceh/N1HPVad4BeNJh3G+gWv9rp/E1/HaXSuMRvcYxzu8emVWv/m79q4AW2t/nxG33OIeL1ono
 UgqFmZNT0W3PcMpw4e+yfLvZrmGZ75Gu9YEgNz+IitUQ1g9ZYgQCcLEbtPCQHyeBXXE+ZoFdzFe
 7rUFm7175Gb6OML0HAUSS8vxLcqwOlyU3K0TtYmGNvwgZ4gfmM0XCEnzq6rmjKq2fnus2qNBueN
 IJUbBI4V/e6vziBk3E4cKyRIZ17JAZCWOQspwVXbGBNqAaiSIywkNnlprM5M+L5K9uW+4geKmCK
 9kOw==
X-Received: by 2002:a05:6808:1a24:b0:464:5f3:ed1 with SMTP id
 5614622812f47-4673347eda8mr1980938b6e.26.1773256963710; 
 Wed, 11 Mar 2026 12:22:43 -0700 (PDT)
X-Received: by 2002:a05:6808:1a24:b0:464:5f3:ed1 with SMTP id
 5614622812f47-4673347eda8mr1980912b6e.26.1773256963161; 
 Wed, 11 Mar 2026 12:22:43 -0700 (PDT)
Received: from [10.110.3.108] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-4177e72b40asm2946930fac.20.2026.03.11.12.22.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Mar 2026 12:22:42 -0700 (PDT)
Message-ID: <5a048506-dc3e-4435-a427-12bbc08c51e2@oss.qualcomm.com>
Date: Wed, 11 Mar 2026 12:22:40 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/i2c/aspeed: fix lost interrupts on back-to-back
 commands
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, peter.maydell@linaro.org
Cc: steven_lee@aspeedtech.com, leetroy@gmail.com, jamin_lin@aspeedtech.com,
 andrew@codeconstruct.com.au, joel@jms.id.au, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, quan@os.amperecomputing.com,
 jae.yoo@oss.qualcomm.com, Jithu Joseph <jithu.joseph@oss.qualcomm.com>
References: <20260311023712.2730185-1-jithu.joseph@oss.qualcomm.com>
 <de208140-b969-4f5a-a910-6ee2788e1027@kaod.org>
Content-Language: en-US
From: Jithu Joseph <jithu.joseph@oss.qualcomm.com>
In-Reply-To: <de208140-b969-4f5a-a910-6ee2788e1027@kaod.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: YeikPJjOvWZZdjgNw53VS517FxHawwvw
X-Proofpoint-GUID: YeikPJjOvWZZdjgNw53VS517FxHawwvw
X-Authority-Analysis: v=2.4 cv=QLBlhwLL c=1 sm=1 tr=0 ts=69b1c104 cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=vzhER2c_AAAA:8 a=EUspDBNiAAAA:8 a=2ESy-DqD4lkvCjyCqZwA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=_Y9Zt4tPzoBS9L09Snn2:22
 a=0YTRHmU2iG2pZC6F1fw2:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDE2NCBTYWx0ZWRfX3mG3q0qzfHmn
 zsENm5ggr0tmsmIF+gQicsoXBNxmq0DqWrr+EourZ7h05trfdBk23QhdeCztYubO5laWEph23p8
 iSPhOn0apoAdn+Q5610aCGUDnx2COV2WmxNZ3LjsOOxSL/BTNbZFjx4EotU4a/MZ6ygjlFU6W98
 dCvlhhp8bIyX5rMoAvqBTj+kK0ldu0eP90fQNaRmhQncUQeSAcFzH3hgOWzE5iM8kG9aJPrHnC+
 3QU0xVtXJwkte/FkBdDSChzxMECK6Pf6VvYaRcjfPgv6kHSgs97SyPA9Y8/RtltsbjA3E7yTD+1
 t0d98BfPeE1w9gVpvT32AcY3rgQGujISOLcbFW4R5G3X4MSZwRwqinMGrUrqIqorJe9qE74bJ5y
 64Us6ZtKhBhSPUdq2wVP/FNR5//N+Am1AZlLi8TKss2L3b1REVjkwD7ZbeiYVC8xFO5tqjls4Tx
 3yPX01mcWyfSeAJRx0Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 bulkscore=0 impostorscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603110164
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=jithu.joseph@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.819,
 RCVD_IN_VALIDITY_SAFE_BLOCKED=0.903, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 3/11/2026 9:27 AM, Cédric Le Goater wrote:
> Hello Jithu
> 
> On 3/11/26 03:37, Jithu Joseph wrote:
>> QEMU executes I2C commands synchronously inside the CMD register write
>> handler. On real hardware each command takes time on the bus, so the
>> ISR can clear the previous interrupt status before the next completion
>> arrives. In QEMU, when the guest ISR handles a TX_ACK and immediately
>> issues the next command by writing to CMD, that command completes
>> instantly — before the ISR returns to W1C-clear the first TX_ACK.
>> Since the bit is already set, setting it again is a no-op. The ISR
>> then clears it, wiping both completions at once. No interrupt fires
>> for the second command and the driver stalls.
>>
>> This affects any multi-step I2C transaction: register reads, SMBus
>> word reads, and PMBus device probes all fail ("Error: Read failed"
>> from i2cget, -ETIMEDOUT from kernel drivers).
>>
>> The issue is exposed when the guest kernel includes commit "i2c:
>> aspeed: Acknowledge Tx done with and without ACK irq late" [1] which
>> defers W1C acknowledgment of TX_ACK until after the ISR has issued
>> the next command. This means the old TX_ACK is still set when the
>> next command completes synchronously, and the subsequent W1C wipes
>> both completions at once.
>>
>> The trace below shows `i2cget -y 15 0x50 0x00` (read EEPROM register
>> 0x00) failing without the fix. The first START+TX sets TX_ACK. The
>> ISR handles it and issues a second TX to send the register address.
>> That TX completes synchronously while TX_ACK is still set:
>>
>>    aspeed_i2c_bus_cmd cmd=0x3 start|tx| intr=0x0    # START+TX, clean
>>    aspeed_i2c_bus_raise_interrupt intr=0x1 ack|      # TX_ACK set
>>    aspeed_i2c_bus_read  0x10: 0x1                    # ISR reads TX_ACK
>>    aspeed_i2c_bus_write 0x14: 0x2                    # ISR issues TX cmd
>>    aspeed_i2c_bus_cmd cmd=0x400002 tx| intr=0x1      # TX runs, TX_ACK already set!
>>    aspeed_i2c_bus_raise_interrupt intr=0x1 ack|      # re-set is no-op
>>    aspeed_i2c_bus_write 0x10: 0x1                    # ISR W1C clears TX_ACK
>>    aspeed_i2c_bus_read  0x10: 0x0                    # LOST — both ACKs wiped
>>
>> The driver sees INTR_STS=0 and never proceeds to the read phase.
>>
>> Fix this by tracking interrupt bits that collide with already-pending
>> bits. Before calling aspeed_i2c_bus_handle_cmd(), save and clear
>> INTR_STS so that only freshly set bits are visible after the call.
>> Any overlap between the old and new bits is saved in pending_intr_sts.
>> When the ISR later W1C-clears the old bits, re-apply the saved
>> pending bits so the ISR sees them on its next loop iteration.
>>
>> With the fix, the same operation completes successfully:
>>
>>    aspeed_i2c_bus_cmd cmd=0x3 start|tx| intr=0x0    # START+TX, clean
>>    aspeed_i2c_bus_raise_interrupt intr=0x1 ack|      # TX_ACK set
>>    aspeed_i2c_bus_read  0x10: 0x1                    # ISR reads TX_ACK
>>    aspeed_i2c_bus_write 0x14: 0x2                    # ISR issues TX cmd
>>    aspeed_i2c_bus_cmd cmd=0x400002 tx| intr=0x0      # INTR_STS cleared first
>>    aspeed_i2c_bus_raise_interrupt intr=0x1 ack|      # TX_ACK freshly set
>>    aspeed_i2c_bus_write 0x10: 0x1                    # ISR W1C clears TX_ACK
>>    aspeed_i2c_bus_read  0x10: 0x1                    # RE-DELIVERED from pending
>>    aspeed_i2c_bus_write 0x14: 0x1b                   # ISR proceeds: START+RX
>>    aspeed_i2c_bus_cmd cmd=0x40001b start|tx|rx|last| # read phase completes
>>    i2c_recv recv(addr:0x50) data:0x00                # data received
>>
>> [1] https://lore.kernel.org/all/20231211102217.2436294-3-quan@os.amperecomputing.com/
>>
>> Signed-off-by: Jithu Joseph <jithu.joseph@oss.qualcomm.com>
> 
> Could you please provide a Fixes: tag for this change ?

The issue stems from QEMU's synchronous I2C command execution model which has been present since the initial driver introduction (1602001195dc). It is not a regression introduced by a specific commit, but rather a fundamental mismatch between QEMU's synchronous model and the temporal separation that real hardware has between command issue, command completion and ISR acknowledgment. This mismatch is exposed by the pending Linux kernel driver change [1 above] which reorders the ISR to issue the next command before W1C-clearing the current interrupt — a change needed for I2C slave mode to work correctly on real hardware.

I spent a bit of time looking at the commit history for hw/i2c/aspeed_i2c.c and considered 5540cb97f711 ("aspeed/i2c: interrupts should be cleared by software only") for fixes tag,  since it seemed to make the collision more visible by correctly implementing W1C semantics (removing an initialization bus->intr_status = 0), but the underlying race I think would have existed prior to that commit as well.

Happy to add Fixes: 1602001195dc ("i2c: add aspeed i2c controller") if you feel a Fixes tag is still appropriate, or drop it entirely given the fundamental nature of the issue. Your call.


> 
>> ---
>> Background: A Linux kernel patch series by Quan Nguyen (Ampere) reworked
>> the i2c-aspeed driver's interrupt handling to delay the W1C clear of
>> TX_ACK until after the ISR has processed the completion and issued any
>> follow-up command. The motivation was to correctly handle AST2600 and
>> AST2500 hardware where I2C slave mode requires this ordering — the
>> authors explicitly verified the series on both platforms. On our internal
>> AST2600 hardware we carry this patch as a necessary fix for I2C slave
>> mode to work correctly.
>>
>> The series did not make it into the upstream Linux kernel because test
>> failures on QEMU blocked it. 
> 
> Oh. Good to see that QEMU is trusted (even when wrong). Time for a fix !

:-)

> 
>> However, the failures are on the emulation
>> side: QEMU executes I2C commands synchronously inside the MMIO write
>> handler, causing a follow-up command to complete and re-raise an
>> already-pending interrupt bit before the ISR has had a chance to
>> W1C-clear it. On real hardware this race cannot occur since bus
>> transactions take measurable time.
>>
>> Since the kernel patch reflects correct real-hardware behaviour, the
>> right fix is to adapt QEMU's interrupt delivery to handle this ordering,
>> rather than requiring the kernel driver to work around a QEMU-specific
>> timing artifact. This patch does that.
> 
> LGTM,
> 
> Thanks for this detailed report.
> 

Thanks for considering and reading through


Jithu

