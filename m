Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E46FBC43458
	for <qemu-arm@archiver.kernel.org>; Mon,  6 Jul 2026 08:10:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wgePI-0008Fz-O1; Mon, 06 Jul 2026 04:10:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wgePH-0008DR-2r
 for qemu-arm@nongnu.org; Mon, 06 Jul 2026 04:10:23 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wgePE-0003GG-Qk
 for qemu-arm@nongnu.org; Mon, 06 Jul 2026 04:10:22 -0400
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66641Swe3593989
 for <qemu-arm@nongnu.org>; Mon, 6 Jul 2026 08:10:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 NCqjXVBAcphH6bgcVF/FSO75xoQ/plzIdNFfJIMVrsY=; b=eu3qy3rS5QeAtwpE
 JfAPe8inwcPZ0eOYYFj3lJZ1Qzc9iIA4ELDEwSShdxqkq55zh4EQCQqI70sorDuD
 gfvB/t6GSZco1640nw5Na1jq32rEt25qiUvwPrtDU2PC2yd3i8UXtNAoHN9kYVnR
 SL/YdDLedbeG489oeKEFWYsAfTmZqHk9axfN3QnmYvbjD1QMeIjaf3a+/rc24UBy
 a4to5ig9ii+b4AFJPjdvhhS0o9tR2otz6NQg01llcL5Uu5H74SSIW0dG/Hwnnpjr
 YoE4WjYtSBbU84KTeB+bV33jsInfJCa+wQQaHAkCouVAgyCOqtnpAQtyOJbTraZI
 6XKcTA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6qvgwhfd-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Mon, 06 Jul 2026 08:10:18 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-92e8004d60eso442775185a.1
 for <qemu-arm@nongnu.org>; Mon, 06 Jul 2026 01:10:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1783325418; x=1783930218; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=NCqjXVBAcphH6bgcVF/FSO75xoQ/plzIdNFfJIMVrsY=;
 b=P/GCTI/jYqj3O4DFLri/KG9db/0UuwviQ0Hkx6B4ChyqQrSFQBiUaRT8gN9P8Gm37r
 OxSPTNVULEHWHIuVWOfe1UwygQtxuFLjWRfKBD7nv56a3/TTboonwVlBmVMQftG/ZHjZ
 8wRZgttcO1SZ7iDWGcFKENfpoy25WO+mx/HIoauont7ZG2lOjX/huLbvPVqsR15OY3gc
 vcUZTygDiEHeShKXZERDl7cITX1opVwXKAixk/FyitEwMdqV06O3xWF8xdsOO2LFPBS5
 cNNo5vwJ+LeGqMGX3t9lRkUI2IL6TMjKUfThC2j0KkQoKI+uChLbSKHyXs2Qbc5wPnk9
 UlyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783325418; x=1783930218;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=NCqjXVBAcphH6bgcVF/FSO75xoQ/plzIdNFfJIMVrsY=;
 b=PAWfozoxo7vlV1laI/a7Z4jvPA+yLPCYOp+2F/En7pPhxSrRqAzCYJ0ZXC65fg1K3x
 CcSbEgyUQWNyaQk0CQaVBsJwuf6VBhysrDMgXaOXNbI4r90cgpbDJjkBXrktA1OtFvYG
 lhXbpCLn0ZmNdspHDm9NayZnDoi30SD3AidYsf+86qSaKY0vQhgUgxyThpQfZESxoXkV
 0/rx9j16y4CHNSymV6+q/1KXyi7qsf1gnJKlFI4TCM1nhotJtQDQYvnCLqxBZtiM+c88
 kddiL9Pdzbj0FMMczgdMdtyx89ugnBfNO8N86TPEL9QjVAI5k5BcQJU2ct3vdYe02ie8
 +M3w==
X-Forwarded-Encrypted: i=1;
 AHgh+RpWddiI8xGYwlTnR9/P8mMDFt6avYSKktWTtqr1GyCcYKsomJ20+l8G6lJj9dl7sUG649Iun8RNDQ==@nongnu.org
X-Gm-Message-State: AOJu0Yyb0iHYEXbmQEsP85RmE3f+CM3OEukib9ZkHFAxG4uVgsW4UaCT
 sxDLcgSNoUBcry13518xxUGAjX3silBBG0FQlWS5QBALaWODNtXe6LV3VVyk3Brf3br1G8SGwZM
 h+PM3hSQXb3NpXPmAfl8DYXspgKdAtja6skFnhQYFCLEH+KIXK5DdBVo=
X-Gm-Gg: AfdE7cladqVVSdFwxn4R/aCIBOtn8FPIAwcBH/Bklcm7+lBwlq+xT0ndmguG3rqUb0d
 Z6HbffVaRQqFtStylQyqeogYDm+SqT7gw0RL2S4LJ1nkRo562LCJXvahhc6Caz+nNWESZq1WcFN
 wUo8mLIL9M6Uv16ivGw9cbZvCE9PBjYgbrems11dtIyf5ZTkt1AcpVKBPW1fMfi+0+iHLZArKCE
 IaXLXQGvo1DWyvtdQUheNZwIi8XEhwyOBbG9G/9tQ7+6JVUz6gG5UisG3GP/eoUEVdqGLM2fVCM
 7qstqJ5AEoNmJ8E1qzO0f4prd+XQK+Oxzm2xVTicLLVQqz/QLNw452mh1hprM2zIaWZQoH70nSC
 eZQ8LgWL9tyH5KepWmb3wmAzZtWvIyxWDUQqr3z7QzA7j4IRlI1IM72amJ4JkUw==
X-Received: by 2002:a05:620a:450f:b0:92e:8a8d:ec1f with SMTP id
 af79cd13be357-92e9a350504mr1294561385a.24.1783325417891; 
 Mon, 06 Jul 2026 01:10:17 -0700 (PDT)
X-Received: by 2002:a05:620a:450f:b0:92e:8a8d:ec1f with SMTP id
 af79cd13be357-92e9a350504mr1294558085a.24.1783325417409; 
 Mon, 06 Jul 2026 01:10:17 -0700 (PDT)
Received: from [192.168.69.219] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c12b628d632sm682303466b.31.2026.07.06.01.10.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Jul 2026 01:10:16 -0700 (PDT)
Message-ID: <7410bfdc-e1b8-4cb7-8e55-5908104290de@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 10:10:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/10] hw/ssi: xilinx_spips: Fix dummy phase handling
Content-Language: en-US
To: Bin Meng <bin.meng@processmission.com>, QEMU <qemu-devel@nongnu.org>
Cc: Alistair Francis <alistair@alistair23.me>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
References: <20260630135729.466264-1-bin.meng@processmission.com>
 <20260630135729.466264-7-bin.meng@processmission.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260630135729.466264-7-bin.meng@processmission.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=VvoTxe2n c=1 sm=1 tr=0 ts=6a4b62ea cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=Am4ss40yAAAA:8 a=FRSEYCzRAAAA:8 a=ZmCK42fXN8tGheKeWVsA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=lf-hbUz_c89dky27wAWH:22
 a=H4N_Y-AU75W7NKDNhZlT:22
X-Proofpoint-ORIG-GUID: UG1PTXx1tZpvT4Wdky4e5V7Tx40uBoA8
X-Proofpoint-GUID: UG1PTXx1tZpvT4Wdky4e5V7Tx40uBoA8
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA4MSBTYWx0ZWRfX7w1BnR012aCF
 KmEOs+UGNBUQpPZ7heXTxHrsNnQVKgaVnO+7UlQ7ThH//SibCUs8dvRHACkcfmC7xRDnUf2McOI
 l3Dqwmb0DPqS0pT+ame+ZYlxkpMYHPo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA4MSBTYWx0ZWRfX/tKFJIq61CGD
 VbixAhnrjpeun6kWJyUp7SwWSduxy2QkOlcbOueasW2eytXQdNXR9/sbC5o9aNd6nxm52H8FrKy
 IKvu+2E3DBYYXr+H2sF/XIKS7U0YbAaST31Uun9TVd+iyRpil4aGbBbyCN5CkZjc9RMgVWD/uNi
 rhw9b38eRJvLMA9TAJSElPy+wU8/bwvaIp+53jNBNkfbGdCfXmMFmHpKrf4VIij78jeeTZn/XxV
 q3J13nMi+M//a2OWpftAy72fG1kkE1lPzQYiJSo9F5ij4Y1Xgq6JxOWfP0ACikLLcK1ANIixT5U
 LwBebFoZgqToacDXncZ1mqSh+zqX7HvRmDJ7WL1EkjQATHoyVrRp09WvcqFpkzbL1YzF5J3Nftp
 v2fklpMnmNabk+D3s8zLB4tmd0Y/KjHjgDCCPtXyQNj+pyaxh6lN/yfUGxlbXkV7+cqNwOjYPiN
 MIk/4U2s4uLSS6KLvBQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 suspectscore=0 impostorscore=0 clxscore=1015 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060081
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 30/6/26 15:57, Bin Meng wrote:
> The ZynqMP generic FIFO encodes dummy phases as a number of
> dummy cycles. QEMU's SSI bus transfers whole bytes, so the
> controller model must convert the programmed cycle count to the
> number of SSI byte transfers needed for the selected SPI, dual SPI
> or quad SPI mode.
> 
> The legacy Xilinx QSPI snoop paths had the opposite problem after
> the m25p80 dummy handling was fixed. They still treated each dummy
> byte queued through the FIFO as a request to generate several SSI
> transfers based on the current link width. The flash model now
> consumes dummy phases as byte counts, so the manual FIFO path should
> forward one SSI transfer per dummy byte.
> 
> Update the Xilinx QSPI dummy accounting consistently for the generic
> FIFO, manual FIFO and LQSPI direct-read paths. Also make the command
> table report the dummy byte counts consumed by m25p80 for dual and
> quad output reads, and account for the mode byte before LQSPI data
> reads begin.
> 
> This matches the ZynqMP TRM (ug1085, v2.2 [1]) description of the
> generic FIFO dummy cycle entry and keeps the controller side aligned
> with the flash model's dummy byte ownership.
> 
> The description of the genenic command fifo register says:
> 
>    When [receive, transmit, data_xfer] = [0,0,1], the [immediate_data]
>    field represents the number of dummy cycle sent on the SPI interface.
> 
> [1] https://www.xilinx.com/support/documentation/user_guides/ug1085-zynq-ultrascale-trm.pdf
>      table 24‐22, an example of Generic FIFO Contents for Quad I/O Read Command (EBh)
> 
> Fixes: ef06ca3946e2 ("xilinx_spips: Add support for RX discard and RX drain")
> Fixes: c95997a39de6 ("xilinx_spips: Add support for the ZynqMP Generic QSPI")
> Signed-off-by: Bin Meng <bin.meng@processmission.com>
> ---
> 
>   include/hw/ssi/xilinx_spips.h |   2 +-
>   hw/ssi/xilinx_spips.c         | 120 ++++++++++++++++++++++++----------
>   2 files changed, 88 insertions(+), 34 deletions(-)


> diff --git a/hw/ssi/xilinx_spips.c b/hw/ssi/xilinx_spips.c
> index f6e717bc01..fa98dc2dd8 100644
> --- a/hw/ssi/xilinx_spips.c
> +++ b/hw/ssi/xilinx_spips.c
> @@ -192,6 +192,10 @@
>       FIELD(GQSPI_GF_SNAPSHOT, EXPONENT, 9, 1)
>       FIELD(GQSPI_GF_SNAPSHOT, DATA_XFER, 8, 1)
>       FIELD(GQSPI_GF_SNAPSHOT, IMMEDIATE_DATA, 0, 8)
> +#define GQSPI_GF_MODE_SPI     1
> +#define GQSPI_GF_MODE_DSPI    2
> +#define GQSPI_GF_MODE_QSPI    3


> @@ -457,6 +461,7 @@ static void xlnx_zynqmp_qspips_flush_fifo_g(XlnxZynqMPQSPIPS *s)
>           int i;
>   
>           if (!s->regs[R_GQSPI_DATA_STS]) {
> +            uint32_t prev_gf_snapshot = s->regs[R_GQSPI_GF_SNAPSHOT];
>               uint8_t imm;
>   
>               s->regs[R_GQSPI_GF_SNAPSHOT] = fifo32_pop(&s->fifo_g);
> @@ -484,7 +489,54 @@ static void xlnx_zynqmp_qspips_flush_fifo_g(XlnxZynqMPQSPIPS *s)
>                   }
>                   s->regs[R_GQSPI_DATA_STS] = 1ul << imm;
>               } else {
> -                s->regs[R_GQSPI_DATA_STS] = imm;
> +                /*
> +                 * When [receive, transmit, data_xfer] = [0,0,1], it represents
> +                 * the number of dummy cycle sent on the SPI interface. We need
> +                 * to convert the number of dummy cycles to bytes according to
> +                 * the SPI mode being used.
> +                 *
> +                 * Ref: ug1085 v2.2 (December 2020) table 24‐22, an example of
> +                 *      Generic FIFO Contents for Quad I/O Read Command (EBh)
> +                 */
> +                if (!ARRAY_FIELD_EX32(s->regs, GQSPI_GF_SNAPSHOT, TRANSMIT) &&
> +                    !ARRAY_FIELD_EX32(s->regs, GQSPI_GF_SNAPSHOT, RECIEVE)) {
> +                    uint8_t spi_mode = ARRAY_FIELD_EX32(s->regs, GQSPI_GF_SNAPSHOT, SPI_MODE);
> +                    /*
> +                     * Some ZynqMP GQSPI drivers, such as Linux, use the data
> +                     * bus width in the dummy GENFIFO entry only to configure
> +                     * the controller mode. The immediate value is already
> +                     * the number of dummy cycles for the dummy phase, which
> +                     * follows the address bus width. Reuse the previous TX
> +                     * phase mode to convert cycles to SSI bytes.
> +                     *
> +                     * This does not make the model Linux-only. U-Boot emits
> +                     * the dummy entry with op->dummy.buswidth, so the entry
> +                     * mode already matches the dummy phase. Its opcode and
> +                     * address phases are immediate entries, not DATA_XFER TX
> +                     * entries, so the override below is not taken for U-Boot.
> +                     */
> +                    if (FIELD_EX32(prev_gf_snapshot, GQSPI_GF_SNAPSHOT,
> +                                   DATA_XFER) &&
> +                        FIELD_EX32(prev_gf_snapshot, GQSPI_GF_SNAPSHOT,
> +                                   TRANSMIT) &&
> +                        !FIELD_EX32(prev_gf_snapshot, GQSPI_GF_SNAPSHOT,
> +                                    RECIEVE)) {
> +                        spi_mode = FIELD_EX32(prev_gf_snapshot,
> +                                              GQSPI_GF_SNAPSHOT, SPI_MODE);
> +                    }
> +
> +                    if (spi_mode == GQSPI_GF_MODE_QSPI) {
> +                        s->regs[R_GQSPI_DATA_STS] = ROUND_UP(imm * 4, 8) / 8;
> +                    } else if (spi_mode == GQSPI_GF_MODE_DSPI) {
> +                        s->regs[R_GQSPI_DATA_STS] = ROUND_UP(imm * 2, 8) / 8;
> +                    } else if (spi_mode == GQSPI_GF_MODE_SPI) {
> +                        s->regs[R_GQSPI_DATA_STS] = ROUND_UP(imm * 1, 8) / 8;
> +                    } else {
> +                        qemu_log_mask(LOG_GUEST_ERROR, "Unknown SPI MODE: 0x%x ", spi_mode);

Is it safe to let the previous s->regs[R_GQSPI_DATA_STS] value?

Alternatively simpler as:

  if (spi_mode) {
      s->regs[R_GQSPI_DATA_STS] = 2 * (spi_mode - 1) * imm;

> +                    }
> +                } else {
> +                    s->regs[R_GQSPI_DATA_STS] = imm;
> +                }
>               }
>           }
>           /* Zero length transfer check */
> @@ -550,7 +602,7 @@ static void xlnx_zynqmp_qspips_flush_fifo_g(XlnxZynqMPQSPIPS *s)
>       }
>   }

