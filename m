Received: by 10.25.208.194 with SMTP id h185csp1795351lfg;
        Tue, 19 Apr 2016 02:08:03 -0700 (PDT)
X-Received: by 10.140.223.199 with SMTP id t190mr2001725qhb.90.1461056883657;
        Tue, 19 Apr 2016 02:08:03 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s6si49328617qha.96.2016.04.19.02.08.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 19 Apr 2016 02:08:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:54397 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1asRda-00071e-EI
	for alex.bennee@linaro.org; Tue, 19 Apr 2016 05:08:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44788)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Aleksandar.Markovic@imgtec.com>) id 1asRdW-0006xu-CS
	for qemu-arm@nongnu.org; Tue, 19 Apr 2016 05:07:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Aleksandar.Markovic@imgtec.com>) id 1asRdQ-0000sE-2u
	for qemu-arm@nongnu.org; Tue, 19 Apr 2016 05:07:58 -0400
Received: from mailapp01.imgtec.com ([195.59.15.196]:9128)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Aleksandar.Markovic@imgtec.com>)
	id 1asRdP-0000lm-Q9; Tue, 19 Apr 2016 05:07:52 -0400
Received: from HHMAIL01.hh.imgtec.org (unknown [10.100.10.19])
	by Websense Email with ESMTPS id DD495D01ACB39;
	Tue, 19 Apr 2016 10:07:42 +0100 (IST)
Received: from BAMAIL02.ba.imgtec.org (10.20.40.28) by HHMAIL01.hh.imgtec.org
	(10.100.10.19) with Microsoft SMTP Server (TLS) id 14.3.266.1;
	Tue, 19 Apr 2016 10:07:45 +0100
Received: from BADAG02.ba.imgtec.org ([fe80::612d:e977:c603:32d6]) by
	bamail02.ba.imgtec.org ([::1]) with mapi id 14.03.0266.001;
	Tue, 19 Apr 2016 02:07:41 -0700
From: Aleksandar Markovic <Aleksandar.Markovic@imgtec.com>
To: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Thread-Topic: [PATCH v5 9/9] target-mips: Clean up position of
	abs2008/nan2008 cases in genfarith()
Thread-Index: AQHRmYvscgep0XQJ40iUJoz3hPtY9p+RAHIU
Date: Tue, 19 Apr 2016 09:07:40 +0000
Message-ID: <EF5FA6C3467F85449672C3E735957B859169B9B7@BADAG02.ba.imgtec.org>
References: <1460995422-14373-1-git-send-email-aleksandar.markovic@rt-rk.com>,
	<1460995422-14373-10-git-send-email-aleksandar.markovic@rt-rk.com>
In-Reply-To: <1460995422-14373-10-git-send-email-aleksandar.markovic@rt-rk.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [82.117.201.26]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 195.59.15.196
Subject: Re: [Qemu-arm] [PATCH v5 9/9] target-mips: Clean up position of
 abs2008/nan2008 cases in genfarith()
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
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
	"proljc@gmail.com" <proljc@gmail.com>,
	"kbastian@mail.uni-paderborn.de" <kbastian@mail.uni-paderborn.de>,
	"mark.cave-ayland@ilande.co.uk" <mark.cave-ayland@ilande.co.uk>,
	"agraf@suse.de" <agraf@suse.de>,
	Maciej Rozycki <Maciej.Rozycki@imgtec.com>,
	Petar Jovanovic <Petar.Jovanovic@imgtec.com>,
	"blauwirbel@gmail.com" <blauwirbel@gmail.com>,
	"jcmvbkbc@gmail.com" <jcmvbkbc@gmail.com>,
	Miodrag Dinic <Miodrag.Dinic@imgtec.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
	"pbonzini@redhat.com" <pbonzini@redhat.com>,
	"gxt@mprc.pku.edu.cn" <gxt@mprc.pku.edu.cn>,
	Leon Alrae <Leon.Alrae@imgtec.com>, "afaerber@suse.de" <afaerber@suse.de>,
	"aurelien@aurel32.net" <aurelien@aurel32.net>,
	"rth@twiddle.net" <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3LBlyYPp33ug

Diff looks messy, but, in fact, this change is just changing location of
six cases in gen_farith().

This is illustrated in the diagram below: (I added indentation of 2 spaces =
for
abs2008-related cases, and 4 spaces for nan2008-related cases, to stress
the effect of grouping cases with similar handling; right order of cases is
of tremendous help during development; the diagram makes sense only
if it is displayed with fixed width fonts; you can copy/paste it in any edi=
tor
if that is not he case)

    case OPC_ADD_S                           case OPC_ADD_S       =20
    case OPC_SUB_S                           case OPC_SUB_S       =20
    case OPC_MUL_S                           case OPC_MUL_S       =20
    case OPC_DIV_S                           case OPC_DIV_S       =20
    case OPC_SQRT_S                          case OPC_SQRT_S      =20
      case OPC_ABS_S  -------------|         case OPC_MOV_S       =20
    case OPC_MOV_S                 |------>    case OPC_ABS_S     =20
      case OPC_NEG_S                           case OPC_NEG_S     =20
        case OPC_ROUND_L_S         |------>      case OPC_CVT_L_S =20
        case OPC_TRUNC_L_S         |             case OPC_ROUND_L_S
        case OPC_CEIL_L_S          |             case OPC_TRUNC_L_S
        case OPC_FLOOR_L_S         |             case OPC_CEIL_L_S=20
        case OPC_ROUND_W_S         |             case OPC_FLOOR_L_S
        case OPC_TRUNC_W_S         |  |--->      case OPC_CVT_W_S =20
        case OPC_CEIL_W_S          |  |          case OPC_ROUND_W_S
        case OPC_FLOOR_W_S         |  |          case OPC_TRUNC_W_S
    case OPC_SEL_S                 |  |          case OPC_CEIL_W_S=20
    case OPC_SELEQZ_S              |  |          case OPC_FLOOR_W_S
    case OPC_SELNEZ_S              |  |      case OPC_SEL_S       =20
    case OPC_MOVCF_S               |  |      case OPC_SELEQZ_S    =20
    case OPC_MOVZ_S                |  |      case OPC_SELNEZ_S    =20
    case OPC_MOVN_S                |  |      case OPC_MOVCF_S     =20
    case OPC_RECIP_S               |  |      case OPC_MOVZ_S      =20
    case OPC_RSQRT_S               |  |      case OPC_MOVN_S      =20
    case OPC_MADDF_S               |  |      case OPC_RECIP_S     =20
    case OPC_MSUBF_S               |  |      case OPC_RSQRT_S     =20
    case OPC_RINT_S                |  |      case OPC_MADDF_S     =20
    case OPC_CLASS_S               |  |      case OPC_MSUBF_S     =20
    case OPC_MIN_S                 |  |      case OPC_RINT_S      =20
    case OPC_MINA_S                |  |      case OPC_CLASS_S     =20
    case OPC_MAX_S                 |  |      case OPC_MIN_S       =20
    case OPC_MAXA_S                |  |      case OPC_MINA_S      =20
    case OPC_CVT_D_S               |  |      case OPC_MAX_S       =20
        case OPC_CVT_W_S  ------------|      case OPC_MAXA_S      =20
        case OPC_CVT_L_S  ---------|         case OPC_CVT_D_S     =20
    case OPC_CVT_PS_S                        case OPC_CVT_PS_S    =20
    case OPC_CMP_F_S                         case OPC_CMP_F_S     =20
    case OPC_CMP_UN_S                        case OPC_CMP_UN_S    =20
    case OPC_CMP_EQ_S                        case OPC_CMP_EQ_S    =20
    case OPC_CMP_UEQ_S                       case OPC_CMP_UEQ_S   =20
    case OPC_CMP_OLT_S                       case OPC_CMP_OLT_S   =20
    case OPC_CMP_ULT_S                       case OPC_CMP_ULT_S   =20
    case OPC_CMP_OLE_S                       case OPC_CMP_OLE_S   =20
    case OPC_CMP_ULE_S                       case OPC_CMP_ULE_S   =20
    case OPC_CMP_SF_S                        case OPC_CMP_SF_S    =20
    case OPC_CMP_NGLE_S                      case OPC_CMP_NGLE_S  =20
    case OPC_CMP_SEQ_S                       case OPC_CMP_SEQ_S   =20
    case OPC_CMP_NGL_S                       case OPC_CMP_NGL_S   =20
    case OPC_CMP_LT_S                        case OPC_CMP_LT_S    =20
    case OPC_CMP_NGE_S                       case OPC_CMP_NGE_S   =20
    case OPC_CMP_LE_S                        case OPC_CMP_LE_S    =20
    case OPC_CMP_NGT_S                       case OPC_CMP_NGT_S   =20
    case OPC_ADD_D                           case OPC_ADD_D       =20
    case OPC_SUB_D                           case OPC_SUB_D       =20
    case OPC_MUL_D                           case OPC_MUL_D       =20
    case OPC_DIV_D                           case OPC_DIV_D       =20
    case OPC_SQRT_D                          case OPC_SQRT_D      =20
      case OPC_ABS_D  -------------|         case OPC_MOV_D       =20
    case OPC_MOV_D                 |------>    case OPC_ABS_D     =20
      case OPC_NEG_D                           case OPC_NEG_D     =20
        case OPC_ROUND_L_D         |------>      case OPC_CVT_L_D =20
        case OPC_TRUNC_L_D         |             case OPC_ROUND_L_D
        case OPC_CEIL_L_D          |             case OPC_TRUNC_L_D
        case OPC_FLOOR_L_D         |             case OPC_CEIL_L_D=20
        case OPC_ROUND_W_D         |             case OPC_FLOOR_L_D
        case OPC_TRUNC_W_D         |  |--->      case OPC_CVT_W_D =20
        case OPC_CEIL_W_D          |  |          case OPC_ROUND_W_D
        case OPC_FLOOR_W_D         |  |          case OPC_TRUNC_W_D
    case OPC_SEL_D                 |  |          case OPC_CEIL_W_D=20
    case OPC_SELEQZ_D              |  |          case OPC_FLOOR_W_D
    case OPC_SELNEZ_D              |  |      case OPC_SEL_D       =20
    case OPC_MOVCF_D               |  |      case OPC_SELEQZ_D    =20
    case OPC_MOVZ_D                |  |      case OPC_SELNEZ_D    =20
    case OPC_MOVN_D                |  |      case OPC_MOVCF_D     =20
    case OPC_RECIP_D               |  |      case OPC_MOVZ_D      =20
    case OPC_RSQRT_D               |  |      case OPC_MOVN_D      =20
    case OPC_MADDF_D               |  |      case OPC_RECIP_D     =20
    case OPC_MSUBF_D               |  |      case OPC_RSQRT_D     =20
    case OPC_RINT_D                |  |      case OPC_MADDF_D     =20
    case OPC_CLASS_D               |  |      case OPC_MSUBF_D     =20
    case OPC_MIN_D                 |  |      case OPC_RINT_D      =20
    case OPC_MINA_D                |  |      case OPC_CLASS_D     =20
    case OPC_MAX_D                 |  |      case OPC_MIN_D       =20
    case OPC_MAXA_D                |  |      case OPC_MINA_D      =20
    case OPC_CMP_F_D               |  |      case OPC_MAX_D       =20
    case OPC_CMP_UN_D              |  |      case OPC_MAXA_D      =20
    case OPC_CMP_EQ_D              |  |      case OPC_CMP_F_D     =20
    case OPC_CMP_UEQ_D             |  |      case OPC_CMP_UN_D    =20
    case OPC_CMP_OLT_D             |  |      case OPC_CMP_EQ_D    =20
    case OPC_CMP_ULT_D             |  |      case OPC_CMP_UEQ_D   =20
    case OPC_CMP_OLE_D             |  |      case OPC_CMP_OLT_D   =20
    case OPC_CMP_ULE_D             |  |      case OPC_CMP_ULT_D   =20
    case OPC_CMP_SF_D              |  |      case OPC_CMP_OLE_D   =20
    case OPC_CMP_NGLE_D            |  |      case OPC_CMP_ULE_D   =20
    case OPC_CMP_SEQ_D             |  |      case OPC_CMP_SF_D    =20
    case OPC_CMP_NGL_D             |  |      case OPC_CMP_NGLE_D  =20
    case OPC_CMP_LT_D              |  |      case OPC_CMP_SEQ_D   =20
    case OPC_CMP_NGE_D             |  |      case OPC_CMP_NGL_D   =20
    case OPC_CMP_LE_D              |  |      case OPC_CMP_LT_D    =20
    case OPC_CMP_NGT_D             |  |      case OPC_CMP_NGE_D   =20
    case OPC_CVT_S_D               |  |      case OPC_CMP_LE_D    =20
        case OPC_CVT_W_D  ------------|      case OPC_CMP_NGT_D   =20
        case OPC_CVT_L_D  ---------|         case OPC_CVT_S_D     =20
    case OPC_CVT_S_W                         case OPC_CVT_S_W     =20
    case OPC_CVT_D_W                         case OPC_CVT_D_W     =20
    case OPC_CVT_S_L                         case OPC_CVT_S_L     =20
    case OPC_CVT_D_L                         case OPC_CVT_D_L     =20
    case OPC_CVT_PS_PW                       case OPC_CVT_PS_PW   =20
    case OPC_ADD_PS                          case OPC_ADD_PS      =20
    case OPC_SUB_PS                          case OPC_SUB_PS      =20
    case OPC_MUL_PS                          case OPC_MUL_PS      =20
    case OPC_ABS_PS                          case OPC_ABS_PS      =20
    case OPC_MOV_PS                          case OPC_MOV_PS      =20
    case OPC_NEG_PS                          case OPC_NEG_PS      =20
    case OPC_MOVCF_PS                        case OPC_MOVCF_PS    =20
    case OPC_MOVZ_PS                         case OPC_MOVZ_PS     =20
    case OPC_MOVN_PS                         case OPC_MOVN_PS     =20
    case OPC_ADDR_PS                         case OPC_ADDR_PS     =20
    case OPC_MULR_PS                         case OPC_MULR_PS     =20
    case OPC_RECIP2_PS                       case OPC_RECIP2_PS   =20
    case OPC_RECIP1_PS                       case OPC_RECIP1_PS   =20
    case OPC_RSQRT1_PS                       case OPC_RSQRT1_PS   =20
    case OPC_RSQRT2_PS                       case OPC_RSQRT2_PS   =20
    case OPC_CVT_S_PU                        case OPC_CVT_S_PU    =20
    case OPC_CVT_PW_PS                       case OPC_CVT_PW_PS   =20
    case OPC_CVT_S_PL                        case OPC_CVT_S_PL    =20
    case OPC_PLL_PS                          case OPC_PLL_PS      =20
    case OPC_PLU_PS                          case OPC_PLU_PS      =20
    case OPC_PUL_PS                          case OPC_PUL_PS      =20
    case OPC_PUU_PS                          case OPC_PUU_PS      =20
    case OPC_CMP_F_PS                        case OPC_CMP_F_PS    =20
    case OPC_CMP_UN_PS                       case OPC_CMP_UN_PS   =20
    case OPC_CMP_EQ_PS                       case OPC_CMP_EQ_PS   =20
    case OPC_CMP_UEQ_PS                      case OPC_CMP_UEQ_PS  =20
    case OPC_CMP_OLT_PS                      case OPC_CMP_OLT_PS  =20
    case OPC_CMP_ULT_PS                      case OPC_CMP_ULT_PS  =20
    case OPC_CMP_OLE_PS                      case OPC_CMP_OLE_PS  =20
    case OPC_CMP_ULE_PS                      case OPC_CMP_ULE_PS  =20
    case OPC_CMP_SF_PS                       case OPC_CMP_SF_PS   =20
    case OPC_CMP_NGLE_PS                     case OPC_CMP_NGLE_PS =20
    case OPC_CMP_SEQ_PS                      case OPC_CMP_SEQ_PS  =20
    case OPC_CMP_NGL_PS                      case OPC_CMP_NGL_PS  =20
    case OPC_CMP_LT_PS                       case OPC_CMP_LT_PS   =20
    case OPC_CMP_NGE_PS                      case OPC_CMP_NGE_PS  =20
    case OPC_CMP_LE_PS                       case OPC_CMP_LE_PS   =20
    case OPC_CMP_NGT_PS                      case OPC_CMP_NGT_PS  =20
